library(tclust)


### Name: plot.ctlcurves
### Title: plot Method for ctlcurves Objects
### Aliases: plot.ctlcurves
### Keywords: hplot cluster robust multivariate

### ** Examples

## Don't show: 
set.seed(0)
## End(Don't show)
sig <- diag (2)
cen <- rep (1, 2)
x <- rbind(mvtnorm::rmvnorm(108, cen * 0,   sig),
	       mvtnorm::rmvnorm(162, cen * 5,   sig * 6 - 2),
	       mvtnorm::rmvnorm(30, cen * 2.5, sig * 50)
)

ctl <- ctlcurves(x, k = 1:4)
plot(ctl)




