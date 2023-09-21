---
class: CommandLineTool
cwlVersion: v1.2
"$namespaces":
  sbg: https://sevenbridges.com
baseCommand:
- wget
- https://raw.githubusercontent.com/vkt1414/Cloud-Resources-Workflows/main/Notebooks/Totalsegmentator/endToEndTotalSegmentatorNotebook.ipynb
- "&&"
- set
- "-e"
- "&&"
- papermill
inputs:
- id: s5cmdUrls
  type: File
  inputBinding:
    shellQuote: false
    position: 3
- id: converterType
  type: string
  inputBinding:
    shellQuote: true
    position: 2
outputs:
- id: endToEndTotalSegmentatorOutputJupyterNotebook
  type: File?
  outputBinding:
    glob: endToEndTotalSegmentatorOutputJupyterNotebook.ipynb
  sbg:fileTypes: IPYNB
- id: dicomsegAndRadiomicsSR_CompressedFiles
  type: File?
  outputBinding:
    glob: dicomsegAndRadiomicsSR_DICOMsegFiles.tar.lz4
  sbg:fileTypes: LZ4
- id: pyradiomicsRadiomicsFeatures
  type: File?
  outputBinding:
    glob: pyradiomicsRadiomicsFeatures.tar.lz4
  sbg:fileTypes: LZ4
- id: structuredReportsDICOM
  type: File?
  outputBinding:
    glob: structuredReportsDICOM.tar.lz4
  sbg:fileTypes: LZ4
- id: structuredReportsJSON
  type: File?
  outputBinding:
    glob: structuredReportsJSON.tar.lz4
  sbg:fileTypes: LZ4
- id: endToEndTotalSegmentator_UsageMetrics
  type: File?
  outputBinding:
    glob: endToEndTotalSegmentator_UsageMetrics.lz4
  sbg:fileTypes: LZ4
- id: dicomsegAndRadiomicsSR_RadiomicsErrors
  type: File?
  outputBinding:
    glob: radiomics_error_file.txt
  sbg:fileTypes: TXT
- id: dicomsegAndRadiomicsSR_SRErrors
  type: File?
  outputBinding:
    glob: sr_error_file.txt
  sbg:fileTypes: TXT
- id: dcm2niixErrors
  type: File?
  outputBinding:
    glob: error_file.txt
  sbg:fileTypes: TXT
- id: totalsegmentatorErrors
  type: File?
  outputBinding:
    glob: totalsegmentator_errors.txt
- id: dicomSegErrors
  type: File?
  outputBinding:
    glob: itkimage2segimage_error_file.txt
label: TotalSegmentatorEndtoEnd
arguments:
- prefix: "-p"
  shellQuote: false
  position: 2
  valueFrom: converterType
- prefix: "-p"
  shellQuote: false
  position: 3
  valueFrom: csvFilePath
- prefix: ''
  shellQuote: false
  position: 5
  valueFrom: endToEndTotalSegmentatorNotebook.ipynb
- prefix: ''
  shellQuote: false
  position: 6
  valueFrom: endToEndTotalSegmentatorOutputJupyterNotebook.ipynb
requirements:
- class: ShellCommandRequirement
- class: LoadListingRequirement
- class: DockerRequirement
  dockerPull: vamsithiriveedhi/totalsegmentator:end_to_end_v1
- class: InlineJavascriptRequirement
hints:
- class: sbg:AWSInstanceType
  value: g4dn.xlarge;ebs-gp2;25
sbg:projectName: IDC
sbg:revisionsInfo:
- sbg:revision: 0
  sbg:modifiedBy: vamsikrishna14
  sbg:modifiedOn: 1685410682
  sbg:revisionNotes: Copy of vamsikrishna14/idc/dicomsegandradiomicssr/1
- sbg:revision: 1
  sbg:modifiedBy: vamsikrishna14
  sbg:modifiedOn: 1685411485
  sbg:revisionNotes: ''
sbg:image_url:
sbg:appVersion:
- v1.2
id: https://cgc-api.sbgenomics.com/v2/apps/vamsikrishna14/idc/totalsegmentatorend-to-end/1/raw/
sbg:id: vamsikrishna14/idc/totalsegmentatorend-to-end/1
sbg:revision: 1
sbg:revisionNotes: ''
sbg:modifiedOn: 1685411485
sbg:modifiedBy: vamsikrishna14
sbg:createdOn: 1685410682
sbg:createdBy: vamsikrishna14
sbg:project: vamsikrishna14/idc
sbg:sbgMaintained: false
sbg:validationErrors: []
sbg:contributors:
- vamsikrishna14
sbg:latestRevision: 1
sbg:publisher: sbg
sbg:content_hash: a167b937f080f99d795d977209c6217bf0ca43aa483083f6fd0523c82ab323097
sbg:workflowLanguage: CWL