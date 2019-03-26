library(bayess)


### Name: isinghm
### Title: Metropolis-Hastings for the Ising model
### Aliases: isinghm
### Keywords: Ising model random walk Metropolis-Hastings

### ** Examples

prepa=runif(1,0,2)
prop=isinghm(10,24,24,prepa)
image(1:24,1:24,prop)



