library(GMSimpute)


### Name: TS.Lasso
### Title: Two-Step Lasso for missing peaks imputation
### Aliases: TS.Lasso

### ** Examples

data('tcga.bc')
# tcga.bc contains mass specturm abundance of 150 metabolites for 30 breast cancer
# tumor and normal tissue samples with missing values.

imputed=TS.Lasso(tcga.bc,log.scale=TRUE)
# Impute raw abundance matrix tcga.bc




