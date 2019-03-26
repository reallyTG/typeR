library(BootMRMR)


### Name: Weights.mrmr
### Title: Computation of MRMR weights for gene selection
### Aliases: Weights.mrmr
### Keywords: gene weights MRMR

### ** Examples


data(rice_salt)
x=as.data.frame(rice_salt[-1,])
y=as.numeric(rice_salt[1,])
Weights.mrmr(x, y)



