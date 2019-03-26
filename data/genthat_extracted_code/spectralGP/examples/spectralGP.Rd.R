library(spectralGP)


### Name: spectralGP
### Title: spectralGP - tools for specifying Gaussian processes using the
###   computationally efficient Fourier basis
### Aliases: spectralGP
### Keywords: models smooth spatial

### ** Examples

gp1=gp(128,matern.specdens,c(1,4))
gp2=gp(c(64,64),matern.specdens,c(1,4))
simulate(gp1)
simulate(gp2)
plot(gp1)
plot(gp2)
gridvals=predict(gp1)
newlocs=runif(100)
offgridvals=predict(gp1,newlocs)



