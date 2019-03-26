library(Temporal)


### Name: survLogLik
### Title: Survival Distribution Log Likelihood
### Aliases: survLogLik

### ** Examples

## Not run: 
##D # Simulate
##D D = rWeibull(n=1e3,a=2,l=2,p=0.2);
##D # Log likelihood
##D ll = survLogLik(time=D$time,status=D$status,
##D dist="weibull",theta=list("a"=2,"l"=2),log.scale=F);
## End(Not run)



