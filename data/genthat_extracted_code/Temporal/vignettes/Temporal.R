## ----global_options, include=FALSE---------------------------------------
knitr::opts_chunk$set(echo=T,cache=T,results='hold');
library(Temporal);
set.seed(101);

## ------------------------------------------------------------------------
# Generate exponential time to event data
D = rWeibull(n=1e3,a=1,l=2,p=0.2);
# Estimate parameters
M = fitParaSurv(time=D$time,status=D$status,dist="exp");
show(M);

## ------------------------------------------------------------------------
# Generate gamma time to event data
D = rGamma(n=1e3,a=2,l=2,p=0.2);
# Estimate parameters
M = fitParaSurv(time=D$time,status=D$status,dist="gamma");
show(M);

## ------------------------------------------------------------------------
set.seed(100);
# Generate generalized gamma time to event data
D = rGenGamma(n=1e4,a=2,b=2,l=2,p=0.2);
# Estimate parameters
M = fitParaSurv(time=D$time,status=D$status,dist="gengamma",report=T);
show(M);

## ---- results='markup'---------------------------------------------------
set.seed(103);
# Generate generalized gamma time to event data
D = rGenGamma(n=1e3,a=2,b=2,l=2,p=0.2);
# Estimate parameters
fitParaSurv(time=D$time,status=D$status,dist="gengamma",report=T);
# Initialization
init0 = list("la"=log(2),"lb"=log(2),"ll"=log(2));
fitParaSurv(time=D$time,status=D$status,dist="gengamma",init=init0,report=T);

## ------------------------------------------------------------------------
# Generate log-logistic time to event data
D = rLogLogistic(n=1e3,a=4,l=2,p=0.2);
# Estimate parameters
M = fitParaSurv(time=D$time,status=D$status,dist="log-logistic");
show(M);

## ------------------------------------------------------------------------
# Generate log-normal time to event data
D = rLogNormal(n=1e3,m=1,s=2,p=0.2)
# Estimate parameters
M = fitParaSurv(time=D$time,status=D$status,dist="log-normal");
show(M);

## ------------------------------------------------------------------------
# Generate Weibull time to event data
D = rWeibull(n=1e3,a=2,l=2,p=0.2);
# Estimate parameters
M = fitParaSurv(time=D$time,status=D$status,dist="weibull");
show(M);

## ------------------------------------------------------------------------
# Target group
D1 = rGamma(n=1e2,a=2,l=2,p=0.2);
D1$arm = 1;
# Reference group 
D0 = rGamma(n=1e2,a=2,l=4,p=0.2);
D0$arm = 0;
# Overall data 
D = rbind(D1,D0);
# Comparison
E = compParaSurv(time=D$time,status=D$status,arm=D$arm,dist1="gamma",dist0="gamma");
cat("\n");
show(E);

## ------------------------------------------------------------------------
# Target group
D1 = rWeibull(n=1e2,a=2,l=2,p=0.5);
D1$arm = 1;
# Reference group
D0 = rWeibull(n=1e2,a=2,l=2,p=0.0);
D0$arm = 0;
# Overall data
D = rbind(D1,D0);
# Comparison
E = compParaSurv(time=D$time,status=D$status,arm=D$arm,dist1="weibull",dist0="weibull");
cat("\n");
show(E);

## ------------------------------------------------------------------------
# Target group
D1 = rLogLogistic(n=1e2,a=4,l=pi/(2*sqrt(2)),p=0.2);
D1$arm = 1;
# Reference group
D0 = rGamma(n=1e2,a=(1/2),l=(1/2),p=0.2);
D0$arm = 0;
# Overall data
D = rbind(D1,D0);
# Comparison
E = compParaSurv(time=D$time,status=D$status,arm=D$arm,dist1="log-logistic",dist0="gamma");
cat("\n");
show(E);

## ------------------------------------------------------------------------
set.seed(100);
# Target group
D1 = rLogNormal(n=1e2,m=0,s=sqrt(2*log(2)),p=0.2);
D1$arm = 1;
# Reference group
D0 = rWeibull(n=1e2,a=1,l=1,p=0.2);
D0$arm = 0;
# Overall data
D = rbind(D1,D0);
# Comparison
E = compParaSurv(time=D$time,status=D$status,arm=D$arm,dist1="log-normal",dist0="exp");
cat("\n");
show(E);

