library(sROC)


### Name: bw.CDF
### Title: Bandwidth Selectors for Kernel CDF Estimation
### Aliases: bw.CDF
### Keywords: smoothing

### ** Examples


set.seed(100)
n <- 200
x <- c(rnorm(n/2, mean=-2, sd=1), rnorm(n/2, mean=3, sd=0.8))
bw.CDF(x, method="npdf")
bw.CDF(x, method="ncdf")




