library(BRETIGEA)


### Name: brainCells
### Title: Estimate brain cell type proportions in bulk expression data
###   with marker genes.
### Aliases: brainCells

### ** Examples

## No test: 
ct_res = brainCells(aba_marker_expression, nMarker = 50, species = "combined")
cor.test(ct_res[, "mic"], as.numeric(aba_pheno_data$ihc_iba1_ffpe), method = "spearman")
## End(No test)



