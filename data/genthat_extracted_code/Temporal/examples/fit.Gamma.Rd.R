library(Temporal)


### Name: fit.Gamma
### Title: Gamma Distribution Parameter Estimation
### Aliases: fit.Gamma

### ** Examples

# Simulate
D = rGamma(n=1e3,a=2,l=2);
# Estimate
M = fitParaSurv(time=D$time,status=D$status,dist="gamma");



