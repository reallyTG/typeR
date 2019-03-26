library(BMTME)


### Name: CV.KFold
### Title: Cross-Validation with K Folds
### Aliases: CV.KFold

### ** Examples

## No test: 
data("WheatMadaToy")
phenoMada <- (phenoMada[order(phenoMada$GID),])
pheno <- data.frame(GID = phenoMada[, 1], Response = phenoMada[, 3])

CV.KFold(pheno)
CV.KFold(pheno, set_seed = 123)
CV.KFold(pheno, DataSetID = 'GID', set_seed = 123)
CV.KFold(pheno, DataSetID = 'GID', K = 10, set_seed = 123)
## End(No test)




