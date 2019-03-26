library(BootMRMR)


### Name: bootmr.weight
### Title: Computation of weights for informative genes/ geneset selection
###   using Bootstrap-MRMR technique
### Aliases: bootmr.weight
### Keywords: gene weights bootstrap

### ** Examples


data(rice_salt)
x=as.data.frame(rice_salt[-1,])
y=as.numeric(rice_salt[1,])
s=80
bootmr.weight(x, y, s, plot=FALSE)



