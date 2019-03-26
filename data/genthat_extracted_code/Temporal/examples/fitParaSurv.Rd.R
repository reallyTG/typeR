library(Temporal)


### Name: fitParaSurv
### Title: Fit Parametric Survival Distribution
### Aliases: fitParaSurv

### ** Examples

# Generate cenored gamma data
D = rGamma(n=1e3,a=2,l=2,p=0.2);
# Fit gamma distribution
M = fitParaSurv(time=D$time,status=D$status,dist="gamma");

# Generate cenored weibull data
D = rWeibull(n=1e3,a=2,l=2,p=0.2);
# Fit weibull distribution
M = fitParaSurv(time=D$time,status=D$status,dist="weibull");



