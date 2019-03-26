library(ThresholdROC)


### Name: lines.thres2
### Title: Add threshold lines to a plot (two-state setting)
### Aliases: lines.thres2
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
thresunequal <- thres2(k1, k2, rho, method="unequal", ci=FALSE)
lines(thresunequal, col=3) # almost the same; no confidence interval

## Not run: 
##D   thresboot <- thres2(k1, k2, rho, method="emp", ci.method="b")
##D   lines(thresboot, col=5, which.boot="norm")
## End(Not run)



