library(BRETIGEA)


### Name: adjustBrainCells
### Title: Estimate and adjust for brain cell type proportions in bulk
###   expression data.
### Aliases: adjustBrainCells

### ** Examples

## No test: 
brain_cells_adjusted = adjustBrainCells(aba_marker_expression,
  nMarker = 50, species = "combined")
expression_data_adj = brain_cells_adjusted$expression
cor_mic_unadj = cor.test(as.numeric(aba_marker_expression["AIF1", ]),
  as.numeric(aba_pheno_data$ihc_iba1_ffpe), method = "spearman")
cor_mic_adj = cor.test(expression_data_adj["AIF1", ],
  as.numeric(aba_pheno_data$ihc_iba1_ffpe), method = "spearman")
## End(No test)



