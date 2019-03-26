library(ThresholdROC)


### Name: plot.thres3
### Title: Thresholds and density plot (three-state setting)
### Aliases: plot.thres3
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
thres <- thres3(k1, k2, k3, rho, dist1="norm", dist2="norm",
                dist3="norm", start=start, ci.method="param") 
plot(thres, leg.pos="topright")

# not assuming trinormality
thres <- thres3(k1, k2, k3, rho, dist1="lnorm", dist2="norm",
                dist3="norm", ci.method="boot") 
plot(thres, leg.pos="topright", which.boot="perc")



