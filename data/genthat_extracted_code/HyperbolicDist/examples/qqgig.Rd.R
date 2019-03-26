library(HyperbolicDist)


### Name: GIGPlots
### Title: Generalized Inverse Gaussian Quantile-Quantile and
###   Percent-Percent Plots
### Aliases: qqgig ppgig
### Keywords: hplot distribution

### ** Examples

par(mfrow=c(1,2))
y <- rgig(1000,c(1,2,3))
qqgig(y,c(1,2,3),line=FALSE)
abline(0,1,col=2)
ppgig(y,c(1,2,3))



