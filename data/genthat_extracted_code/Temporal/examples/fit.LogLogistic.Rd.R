library(Temporal)


### Name: fit.LogLogistic
### Title: Log-Logistic Distribution Parameter Estimation
### Aliases: fit.LogLogistic

### ** Examples

# Simulate
D = rLogLogistic(n=1e3,a=4,l=2);
# Estimate
M = fitParaSurv(time=D$time,status=D$status,dist="log-logistic");



