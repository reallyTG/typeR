library(tgp)


### Name: sens
### Title: Monte Carlo Bayesian Sensitivity Analysis
### Aliases: sens
### Keywords: htest multivariate regression spatial tree

### ** Examples

# Take a look at the air quality in New York: Sensitivity of
# ozone levels with respect to solar radiation, wind, and
# temperature. See help(airquality) for details.  
X <- airquality[,2:4]
Z <- airquality$Ozone

# Uncertainty distribution is the default: uniform over range(X)
# There is missing data, which is removed automatically by tgp
# range(X).
s <- suppressWarnings(sens(X=X, Z=Z, nn.lhs=300, model=btgp,
          ngrid=100, span=0.3, BTE=c(5000,10000,10)))

# plot the results
plot(s, layout="sens", ylab="Ozone", main="main effects") 

# plot only the sensitivity indices
plot(s, layout="sens", ylab="Ozone", maineff=FALSE) 

# plot only the main effects, side by side
plot(s, layout="sens", ylab="Ozone", main="", maineff=t(1:3))

# build a 'sens.p' parameter vector for a data-dependent
# informative uncertainty distribution.  For each variable,
# the input distribution will be a scaled Beta with shape=2,
# and mode equal to the data mean
rect <- t(apply(X, 2, range, na.rm=TRUE))
mode <- apply(X , 2, mean, na.rm=TRUE)
shape <- rep(2,3)

# plot a sample from the marginal uncertainty distribution.
Udraw <- lhs(300, rect=rect, mode=mode, shape=shape)
par(mfrow=c(1,3))
for(i in 1:3) hist(Udraw[,i], breaks=15,xlab=names(X)[i]) 

# build sens.p with the 'sens' function.
sens.p <- suppressWarnings(sens(X=X,Z=Z,nn.lhs=300, model=NULL,
               ngrid=100, rect=rect, shape=shape, mode=mode))

# Use predict.tgp to quickly analyze with respect to this new
# uncertainty distribution without re-running the MCMC, then
# plot the results.
s.new <- predict(s, BTE=c(1,1000,1), sens.p=sens.p, verb=1) 
plot(s.new, layout="sens", ylab="Ozone", main="main effects")



