library(ClassComparison)


### Name: SmoothTtest-class
### Title: Class "SmoothTtest"
### Aliases: SmoothTtest SmoothTtest-class as.data.frame,SmoothTtest-method
###   plot,SmoothTtest,missing-method summary,SmoothTtest-method
### Keywords: classes htest multivariate

### ** Examples

showClass("SmoothTtest")
bogus <- matrix(rnorm(30*1000, 8, 3), ncol=30, nrow=1000)
splitter <- rep(FALSE, 30)
splitter[16:30] <- TRUE
x <- TwoGroupStats(bogus, splitter)
y <- SmoothTtest(x)

opar <- par(mfrow=c(2, 3), pch='.')
plot(y, badch=2, goodflag=1)
par(opar)



