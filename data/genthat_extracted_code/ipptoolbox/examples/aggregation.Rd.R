library(ipptoolbox)


### Name: aggregation
### Title: Aggregation
### Aliases: dsdempstersrule dsenvelope dsintersect dssaveintersect
###   dsxaveraging dsxenvelope dswavg dswmix

### ** Examples

lambda1=dsstruct(c(2,3,1))
dss1=dsodf('qexp',100,lambda1);
lambda2=dsstruct(c(5,6,1))
dss2=dsodf('qexp',100,lambda2);
y=dsdempstersrule(dss1,dss2);
y2=dswmix(dss1,dss2,w=c(2,0.5));
dscdf(y);

dscdf(y2);



