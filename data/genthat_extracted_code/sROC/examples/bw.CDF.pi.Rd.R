library(sROC)


### Name: bw.CDF.pi
### Title: Plug-in Bandwidth Selectors for Kernel CDF Estimation
### Aliases: bw.CDF.pi
### Keywords: smoothing

### ** Examples


set.seed(100)
n <- 200
x <- c(rnorm(n/2, mean=-2, sd=1), rnorm(n/2, mean=3, sd=0.8))
bw.CDF.pi(x)
bw.CDF.pi(x, pilot="nrd0")
bw.CDF.pi(x, pilot="nrd")
bw.CDF.pi(x, pilot="bcv")
bw.CDF.pi(x, pilot="sj")
bw.CDF.pi(x, pilot="onestage")




