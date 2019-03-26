library(Temporal)


### Name: compParaSurv
### Title: Compare Parametric Survival Distribution
### Aliases: compParaSurv

### ** Examples

set.seed(100);
## Weibull and Weibull, different means and medians
# Target group
D1 = rWeibull(n=1e3,a=1,l=1,p=0.2);
D1$arm = 1;
# Reference group
D0 = rWeibull(n=1e3,a=1,l=2,p=0.2);
D0$arm = 0;
# Overall data set
D = rbind(D1,D0);
# Comparison
E = compParaSurv(time=D$time,status=D$status,arm=D$arm,dist1="weibull");

## Gamma and Weibull, different means and medians
# Target group
D1 = rGamma(n=1e3,a=2,l=2,p=0.2);
D1$arm = 1;
# Reference group
D0 = rWeibull(n=1e3,a=2,l=2/sqrt(pi),p=0.2);
D0$arm = 0;
# Overall data set
D = rbind(D1,D0);
# Comparison
E = compParaSurv(time=D$time,status=D$status,arm=D$arm,dist1="gamma",dist0="weibull");

## Weibull and Log-normal, different means, same median
# Target group
D1 = rLogNormal(n=1e3,m=0,s=2,p=0.2);
D1$arm = 1;
# Reference group
D0 = rWeibull(n=1e3,a=2,l=sqrt(log(2)),p=0.2);
D0$arm = 0;
# Overall data set
D = rbind(D1,D0);
# Comparison
E = compParaSurv(time=D$time,status=D$status,arm=D$arm,dist1="log-normal",dist0="weibull");



