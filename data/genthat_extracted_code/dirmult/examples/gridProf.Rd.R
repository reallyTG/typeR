library(dirmult)


### Name: gridProf
### Title: Profile log-likelihood of Dirichlet-multinomial model
### Aliases: gridProf

### ** Examples

data(us)
fit <- dirmult(us[[1]],epsilon=10^(-12),trace=FALSE)
## Not run: 
##D grid <- gridProf(us[[1]],fit$theta,from=-0.001,to=0.001,len=10)
##D plot(loglik ~ theta, data=grid, type="l")
## End(Not run)



