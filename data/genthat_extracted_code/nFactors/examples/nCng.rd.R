library(nFactors)


### Name: nCng
### Title: Cattell-Nelson-Gorsuch CNG Indices
### Aliases: nCng
### Keywords: multivariate

### ** Examples

## SIMPLE EXAMPLE OF A CNG ANALYSIS

 data(dFactors)
 eig      <- dFactors$Raiche$eigenvalues

 results  <- nCng(eig, details=TRUE)
 results
 
 plotuScree(eig, main=paste(results$nFactors,
                            " factors retained by the CNG procedure",
                            sep=""))
 


