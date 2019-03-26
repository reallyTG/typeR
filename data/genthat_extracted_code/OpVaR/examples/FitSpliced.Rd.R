library(OpVaR)


### Name: fitSpliced
### Title: Estimation of the threshold, the body and the tail parameters
###   for a spliced distribution
### Aliases: fitSpliced fitSplicedPar

### ** Examples

 data(lossdat)
 fitSpliced(lossdat[[3]],"gamma","gpd",method="Fixed",thresh=2000)



