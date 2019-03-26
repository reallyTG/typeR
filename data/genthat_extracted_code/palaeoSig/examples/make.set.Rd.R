library(palaeoSig)


### Name: make.set
### Title: Function to simulate species data
### Aliases: make.set
### Keywords: datagen

### ** Examples

calib <- make.set(nspp = 90,ndim = 3,Amax = runif,fun = runif, xpar = c(-50,150), 
    srange = 400, alpha = 4, gamma = 4,n = 100,elen =rep(100,3),emean = rep(50,3),
    edistr ='uniform', cnt = 1000)

# Provide species parameters generated above, so that the fossil data use the 
#    same species parameters.
fos <- make.set(ndim = 3,n = 100,elen =rep(100,3),emean = rep(50,3), edistr ='uniform',
    cnt = 1000, spec = calib$spec)  

# Supplying own environmental variables and species parameters.
env.vars <- make.env(100,elen =rep(100,3),emean = rep(50,3), edistr ='uniform',ndim = 3)
fos <- make.set(cnt = 1000, spec = calib$spec, env = env.vars)  





