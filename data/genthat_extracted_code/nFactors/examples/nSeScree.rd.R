library(nFactors)


### Name: nSeScree
### Title: Standard Error Scree and Coefficient of Determination Procedures
###   to Determine the Number of Components/Factors
### Aliases: nSeScree
### Keywords: multivariate

### ** Examples

## SIMPLE EXAMPLE OF SESCREE AND R2 ANALYSIS

 data(dFactors)
 eig      <- dFactors$Raiche$eigenvalues

 results  <- nSeScree(eig)
 results

 plotuScree(eig, main=paste(results$nFactors[1], " or ", results$nFactors[2],
                            " factors retained by the sescree and R2 procedures",
                            sep=""))
 


