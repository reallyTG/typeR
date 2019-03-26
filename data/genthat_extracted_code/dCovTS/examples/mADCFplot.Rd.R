library(dCovTS)


### Name: mADCFplot
### Title: Distance cross-correlation plot
### Aliases: mADCFplot
### Keywords: plot

### ** Examples

x <- MASS::mvrnorm(100,rep(0,3),diag(3))
## Not run: mADCFplot(x,18,ylim=c(0,0.5))
y <- MASS::mvrnorm(100,rep(0,6),diag(6))
## Not run: mADCFplot(y,b=100)

deaths <- cbind(mdeaths,fdeaths)
## Not run: mADCFplot(deaths,bootMethod="Indep")



