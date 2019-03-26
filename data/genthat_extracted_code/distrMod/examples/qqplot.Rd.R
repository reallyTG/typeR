library(distrMod)


### Name: qqplot
### Title: Methods for Function qqplot in Package 'distrMod'
### Aliases: qqplot qqplot-methods qqplot,ANY,ProbFamily-method
###   qqplot,ANY,Estimate-method qqplot,ANY,UnivariateDistribution-method
### Keywords: hplot distribution

### ** Examples

set.seed(123)
x <- rnorm(40,mean=15,sd=30)
qqplot(x, Chisq(df=15))
NF <- NormLocationScaleFamily(mean=15, sd=30)
qqplot(x, NF, with.lab=TRUE, which.Order=1:5, cex.lbs=1.3)
mlE <- MLEstimator(x, NF)
qqplot(x, mlE)



