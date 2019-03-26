library(HyperbolicDist)


### Name: SkewLaplacePlots
### Title: Skew-Laplace Quantile-Quantile and Percent-Percent Plots
### Aliases: qqskewlap ppskewlap
### Keywords: hplot distribution

### ** Examples

par(mfrow=c(1,2))
y <- rskewlap(1000,c(0.5,1,2))
qqskewlap(y,c(0.5,1,2),line=FALSE)
abline(0,1,col=2)
ppskewlap(y,c(0.5,1,2))



