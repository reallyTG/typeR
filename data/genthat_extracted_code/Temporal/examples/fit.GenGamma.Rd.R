library(Temporal)


### Name: fit.GenGamma
### Title: Generalized Gamma Distribution Parameter Estimation
### Aliases: fit.GenGamma

### ** Examples

set.seed(100);
# Simulate
D = rGenGamma(n=1e4,a=2,b=2,l=2);
# Estimate
M = fitParaSurv(time=D$time,status=D$status,dist="gengamma");



