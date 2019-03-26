library(Temporal)


### Name: fit.LogNormal
### Title: Log-Normal Distribution Parameter Estimation
### Aliases: fit.LogNormal

### ** Examples

# Simulate
D = rLogNormal(n=1e3,m=0,s=1);
# Estimate
M = fitParaSurv(time=D$time,status=D$status,dist="log-normal");



