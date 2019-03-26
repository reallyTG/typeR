library(Weighted.Desc.Stat)


### Name: Weighted.Desc.Stat-package
### Title: Weighted Descriptive Statistics
### Aliases: Weighted.Desc.Stat-package Weighted.Desc.Stat
### Keywords: Weighted Descriptive Statistics Weighted Statistics
###   Real-valued Fuzzy Data Weighted Mean Weighted Variance Weighted
###   Coefficient of Variation Weighted Standard Deviation Weighted
###   Absolute Deviation Weighted Coefficient of Skewness Weighted
###   Coefficient of Kurtosis Weighted Covariance Weighted Pearson's
###   Correlation Coefficent Weighted Histogram Weighted Scatter Plot

### ** Examples

## Weighted statistics for one variable (property):
x <- c(1:10)
mu <- c(0.9, 0.7, 0.8, 0.7, 0.6, 0.4, 0.2, 0.3, 0.0, 0.1)
w.mean(x, mu)
w.sd(x, mu)
w.var(x, mu)
w.ad(x, mu)
w.cv(x, mu)
w.skewness(x, mu)
w.kurtosis(x, mu)

## Weighted covariance, weighted correlation coefficent and weighted scatter
## plot for two variables (properties):
n=50
x =  rnorm(n,0,1)
y =  rnorm(n,0,1)
mu =  runif(n,0,1)
w.cov(x, y, mu)
w.r(x, y, mu)
w.plot(x, y, 0.3, mu, lwd=2)

## Weighted histogram for one variable (property):
n = 5000
x = rnorm(n,17,1)
x[x<14 | x>20] = NA
range(x)
mu = runif(n,0,1)
bre = seq(from=14,to=20,len=18)
cu = seq(from=0,to=1,len=10)
w.hist(x, mu, breaks=bre, cuts=cu, ylim=c(0,n/7), lwd = 2)



