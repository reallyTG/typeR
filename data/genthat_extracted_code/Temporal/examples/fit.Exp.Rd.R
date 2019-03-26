library(Temporal)


### Name: fit.Exp
### Title: Exponential Distribution Parameter Estimation
### Aliases: fit.Exp

### ** Examples

# Simulate
D = rWeibull(n=1e3,a=1,l=2);
# Estimate
M = fitParaSurv(time=D$time,status=D$status,dist="exp");



