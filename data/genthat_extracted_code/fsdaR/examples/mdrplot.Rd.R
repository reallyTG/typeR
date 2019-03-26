library(fsdaR)


### Name: mdrplot
### Title: Plots the trajectory of minimum deletion residual (mdr)
### Aliases: mdrplot
### Keywords: robust regression

### ** Examples

## Not run: 
##D 
##D n <- 100
##D y <- rnorm(n)
##D X <- matrix(rnorm(n*4), nrow=n)
##D 
##D out <- fsreg(y~X, method="LTS")
##D out <- fsreg(y~X, method="FS", bsb=out$bs, monitoring=TRUE)
##D mdrplot(out)
## End(Not run)



