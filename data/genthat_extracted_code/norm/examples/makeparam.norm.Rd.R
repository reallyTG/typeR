library(norm)


### Name: makeparam.norm
### Title: Convert normal parameters to packed storage
### Aliases: makeparam.norm
### Keywords: regression

### ** Examples

data(mdata)
s <- prelim.norm(mdata)   #do preliminary manipulations
thetahat <- em.norm(s)   #compute mle
thetahat <- getparam.norm(s,thetahat,corr=TRUE)   #extract parameters
thetahat$r   #look at mle correlations
thetahat$r[1,2] <- .5   #tweak a parameter
thetahat <- makeparam.norm(s,thetahat)   #convert to packed storage
thetahat <- em.norm(s,thetahat) #run EM again from new starting value



