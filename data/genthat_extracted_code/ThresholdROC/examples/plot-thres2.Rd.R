library(ThresholdROC)


### Name: plot.thres2
### Title: Threshold and density plot (two-state setting)
### Aliases: plot.thres2
### Keywords: threshold plot

### ** Examples

n1 <- 100
n2 <- 100
set.seed(1234)
par1.1 <- 0
par1.2 <- 1
par2.1 <- 2
par2.2 <- 1
rho <- 0.2
k1 <- rnorm(n1, par1.1, par1.2) # non-diseased
k2 <- rnorm(n2, par2.1, par2.2) # diseased

thres <- thres2(k1, k2, rho, method="eq", ci.method="d")
plot(thres, col=c(1, 2, 4), lwd=c(2, 2, 1), leg.pos="topright")



