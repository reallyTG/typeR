library(nFactors)


### Name: plotParallel
### Title: Plot a Parallel Analysis Class Object
### Aliases: plotParallel
### Keywords: Graphics

### ** Examples

## SIMPLE EXAMPLE OF A PARALLEL ANALYSIS
## OF A CORRELATION MATRIX WITH ITS PLOT
 data(dFactors)
 eig      <- dFactors$Raiche$eigenvalues
 subject  <- dFactors$Raiche$nsubjects
 var      <- length(eig)
 rep      <- 100
 cent     <- 0.95
 results  <- parallel(subject,var,rep,cent)

 results


## PARALLEL ANALYSIS SCREE PLOT
 plotParallel(results, x=eig)
 plotParallel(results)

 


