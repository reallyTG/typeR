library(forward)


### Name: plot.fwdglm
### Title: Forward Search in Generalized Linear Models
### Aliases: plot.fwdglm
### Keywords: robust regression models

### ** Examples
 
## Not run: 
##D data(cellular)
##D mod <- fwdglm(y ~ as.factor(TNF) + as.factor(IFN), data=cellular, 
##D               family=poisson(log), nsamp=200)
##D summary(mod)
##D plot(mod)
## End(Not run)



