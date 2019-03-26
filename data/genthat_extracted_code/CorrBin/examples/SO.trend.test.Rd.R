library(CorrBin)


### Name: SO.trend.test
### Title: Likelihood ratio test of stochastic ordering
### Aliases: SO.trend.test
### Keywords: htest nonparametric

### ** Examples

data(shelltox)
set.seed(45742)
sh.test <- SO.trend.test(shelltox, R=10, control=soControl(eps=0.1, max.directions=25))
sh.test

#a plot of the resampled LRT values
#would look better with a reasonable value of R
null.vals <- sh.test$boot.res$t[,1]
hist(null.vals, breaks=10,  freq=FALSE, xlab="Test statistic", ylab="Density",
     main="Simulated null-distribution", xlim=range(c(0,20,null.vals)))
points(sh.test$LRT, 0, pch="*",col="red", cex=3)



