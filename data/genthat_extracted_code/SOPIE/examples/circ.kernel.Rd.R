library(SOPIE)


### Name: circ.kernel
### Title: Circular Kernel Density Estimation
### Aliases: circ.kernel
### Keywords: smooth

### ** Examples

simdata<-von_mises_sim(n=5000,k=1,c=0.3,noise=0.2)
circ.kernel(simdata, findh(simdata), to = 1, grid = 512, m = 1)



