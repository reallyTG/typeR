library(TPES)


### Name: TPES_report
### Title: Tumor Purity Estimation using SNVs
### Aliases: TPES_report

### ** Examples

## Generate TPES report for samples "TCGA-A8-A0A7" and "TCGA-HT-8564"
## https://cancergenome.nih.gov/
## Please copy and paste the following lines:
library(TPES)
TPES_report(ID = "TCGA-A8-A0A7", SEGfile = TCGA_A8_A0A7_seg,
SNVsReadCountsFile = TCGA_A8_A0A7_maf, ploidy = TCGA_A8_A0A7_ploidy,
RMB = 0.47, maxAF = 0.55, minCov = 10, minAltReads = 5, minSNVs = 10)

TPES_report(ID = "TCGA-HT-8564", SEGfile = TCGA_HT_8564_seg,
SNVsReadCountsFile = TCGA_HT_8564_maf, ploidy = TCGA_HT_8564_ploidy,
RMB = 0.47, maxAF = 0.55, minCov = 10, minAltReads = 5, minSNVs = 10)




