library(GMSimpute)


### Name: GMS.Lasso
### Title: Generalized Mass Spectrum missing peaks imputation with Two-Step
###   Lasso as default algorithm
### Aliases: GMS.Lasso

### ** Examples

data('tcga.bc')
# tcga.bc contains mass specturm abundance of 150 metabolites for 30 breast cancer 
# tumor and normal tissue samples with missing values.

imputed.compound.min=GMS.Lasso(tcga.bc,log.scale=TRUE,TS.Lasso=FALSE)
# Impute raw abundance matrix tcga.bc with compound minimum

imputed.tslasso=GMS.Lasso(tcga.bc,log.scale=TRUE,TS.Lasso=TRUE)
# Impute raw abundance matrix tcga.bc with TS.Lasso




