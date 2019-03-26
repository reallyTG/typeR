library(fsdaR)


### Name: resfwdplot
### Title: Plots the trajectories of the monitored scaled (squared)
###   residuals
### Aliases: resfwdplot
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
##D resfwdplot(out)
##D 
## End(Not run)



