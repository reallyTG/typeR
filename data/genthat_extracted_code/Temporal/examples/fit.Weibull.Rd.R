library(Temporal)


### Name: fit.Weibull
### Title: Weibull Distribution Parameter Estimation
### Aliases: fit.Weibull

### ** Examples

# Simulate
D = rWeibull(n=1e3,a=2,l=2);
# Estimate
M = fitParaSurv(time=D$time,status=D$status,dist="weibull");



