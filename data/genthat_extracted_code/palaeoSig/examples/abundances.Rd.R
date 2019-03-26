library(palaeoSig)


### Name: abundances
### Title: Generates abundances
### Aliases: abundances
### Keywords: datagen

### ** Examples

spec <- species(nspp = 30,ndim = 10,Amax = runif,fun = runif, xpar = c(-50,150),
    srange = 200, alpha = 4, gamma = 4)
env.var <- make.env(100,elen =rep(100,10),emean = rep(50,10), edistr ='uniform',
    ndim = 10)
spec.abun <- abundances(env.var,spec,200)



