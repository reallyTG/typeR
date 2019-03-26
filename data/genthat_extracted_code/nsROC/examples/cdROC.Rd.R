library(nsROC)


### Name: cdROC
### Title: Cumulative/dynamic ROC curve estimate
### Aliases: cdROC cdROC.default
### Keywords: time-dependent

### ** Examples

# Basic example. Data
set.seed(123)
stime <- rchisq(50,3)
status <- sample(c(rep(1,40), rep(0,10)))
marker <- max(stime) - stime + rnorm(50,0,2)

# Cumulative/dynamic ROC curve estimate at time 2.8 (Cox method is used) with 0.95 confidence
# interval for the area under the curve
cdROC(stime, status, marker, 2.8, ci=TRUE)

# Cumulative/dynamic ROC curve estimate at time 3.1 (Kaplan-Meier method is used)
cdROC(stime, status, marker, 3.1, method="KM")

# Cumulative/dynamic ROC curve estimate at time 3 (kernel-weighted Kaplan-Meier method with
# gaussian kernel and bandwidth 1 is used)
cdROC(stime, status, marker, 3, method="wKM")

# Cumulative/dynamic ROC curve estimate at time 3 (kernel-weighted Kaplan-Meier method with
# biweight kernel and bandwidth equals to 2 is used)
cdROC(stime, status, marker, 3, method="wKM", kernel="other", h=2,
      kernel.fun = function(x,xi,h){u <- (x-xi)/h; 15/(16*h)*(1-u^2)^2*(abs(u)<=1)})



