library(norm)


### Name: ninvwish
### Title: Random normal-inverted Wishart variate
### Aliases: ninvwish
### Keywords: multivariate

### ** Examples

data(mdata)
s <- prelim.norm(mdata)   #do preliminary manipulations
params <- list(1,.5,rep(0,ncol(mdata)), .5*diag(rep(1,ncol(mdata)))) # gives widely dispersed values
rngseed(1234567)
start <- ninvwish(s,params)  # draw a variate
thetahat <- em.norm(s,start=start) # run EM from this starting value



