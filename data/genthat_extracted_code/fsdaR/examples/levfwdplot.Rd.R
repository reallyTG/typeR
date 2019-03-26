library(fsdaR)


### Name: levfwdplot
### Title: Plots the trajectories of the monitored scaled (squared)
###   residuals
### Aliases: levfwdplot
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
##D levfwdplot(out)
##D 
## End(Not run)



