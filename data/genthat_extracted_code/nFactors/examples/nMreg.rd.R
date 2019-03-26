library(nFactors)


### Name: nMreg
### Title: Multiple Regression Procedure to Determine the Number of
###   Components/Factors
### Aliases: nMreg
### Keywords: multivariate

### ** Examples

## SIMPLE EXAMPLE OF A MREG ANALYSIS

 data(dFactors)
 eig      <- dFactors$Raiche$eigenvalues

 results  <- nMreg(eig)
 results

 plotuScree(eig, main=paste(results$nFactors[1], ", ",
                            results$nFactors[2], " or ",
                            results$nFactors[3],
                            " factors retained by the MREG procedures",
                            sep=""))
 


