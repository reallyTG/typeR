library(bayess)


### Name: gibbscap1
### Title: Gibbs sampler for the two-stage open population
###   capture-recapture model
### Aliases: gibbscap1
### Keywords: Gibbs capture-recapture open population

### ** Examples

res=gibbscap1(100,32,21,15,200,10,5)
plot(res$p,type="l",col="steelblue3",xlab="iterations",ylab="p")



