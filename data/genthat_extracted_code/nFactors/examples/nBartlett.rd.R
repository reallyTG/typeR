library(nFactors)


### Name: nBartlett
### Title: Bartlett, Anderson and Lawley Procedures to Determine the Number
###   of Components/Factors
### Aliases: nBartlett
### Keywords: multivariate

### ** Examples

## SIMPLE EXAMPLE OF A BARTLETT PROCEDURE

 data(dFactors)
 eig      <- dFactors$Raiche$eigenvalues

 results  <- nBartlett(x=eig, N= 100, alpha=0.05, details=TRUE)
 results

 plotuScree(eig, main=paste(results$nFactors[1], ", ",
                            results$nFactors[2], " or ",
                            results$nFactors[3],
                            " factors retained by the LRT procedures",
                            sep=""))
 


