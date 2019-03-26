library(RRF)


### Name: tuneRRF
### Title: Tune RRF for the optimal mtry parameter
### Aliases: tuneRRF
### Keywords: classif tree

### ** Examples

data(fgl, package="MASS")
fgl.res <- tuneRRF(fgl[,-10], fgl[,10], stepFactor=1.5)



