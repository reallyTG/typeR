library(EHR)


### Name: zeroOneTable
### Title: Make Zero One Contingency Tables
### Aliases: zeroOneTable

### ** Examples

## full example data
data(dataPheWAS)
demo.covariates <- c('id','exposure','age','race','gender')
phenotypeList <- setdiff(colnames(dd), demo.covariates)
tablePhenotype <- matrix(NA, ncol=4, nrow=length(phenotypeList), 
dimnames=list(phenotypeList, c("n.nocase.nonexp", "n.case.nonexp", 
"n.nocase.exp", "n.case.exp")))
for(i in seq_along(phenotypeList)) {
    tablePhenotype[i, ] <- zeroOneTable(dd[, 'exposure'], dd[, phenotypeList[i]])
}



