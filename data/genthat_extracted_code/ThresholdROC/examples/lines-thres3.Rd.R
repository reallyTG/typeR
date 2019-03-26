library(ThresholdROC)


### Name: lines.thres3
### Title: Add threshold lines to a plot (three-state setting)
### Aliases: lines.thres3
### Keywords: threshold plot

### ** Examples

set.seed(1234)
n <- 100
k1 <- rlnorm(n)
k2 <- rnorm(n, 3, 1)
k3 <- rnorm(n, 5, 1)
rho <- c(1/3, 1/3, 1/3)

# assuming trinormality
start <- c(mean(k1), mean(k3))
thres1 <- thres3(k1, k2, k3, rho, dist1="norm", dist2="norm",
                 dist3="norm", start=start, ci.method="param") 

# not assuming trinormality
start2 <- c(0.05, 0.6, 0.5, 0.95)
set.seed(2014)
thres2 <- thres3(k1, k2, k3, rho, start=start2, B=1000,
                ci.method="boot", dist1="lnorm", dist2="norm",
                dist3="norm") 
plot(thres2, leg.pos="topright", leg.cex=0.8, col=1:4)
lines(thres1, col=5)



