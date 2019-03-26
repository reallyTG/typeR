library(gof)


### Name: cumres.coxph
### Title: Calculates GoF measures for Cox's propoportional hazard model
###   for right censored survival times
### Aliases: cumres.coxph
### Keywords: models regression

### ** Examples

library(survival)

simcox <- function(n=100, seed=1) {
  if (!is.null(seed))
    set.seed(seed)
  require(survival)
  time<-rexp(n); cen<-2*rexp(n);
  status<-(time<cen);
  time[status==0]<-cen[status==0];
  X<-matrix(rnorm(2*n),n,2)
  return(data.frame(time=time, status=status, X))
}
n <- 100; d <- simcox(n); m1 <- coxph(Surv(time,status)~ X1 + X2, data=d)
cumres(m1)

## Not run: 
##D ## PBC example
##D data(pbc)
##D fit.cox <- coxph(Surv(time,status==2) ~ age + edema + bili + protime, data=pbc)
##D system.time(pbc.gof <- cumres(fit.cox,R=2000))
##D par(mfrow=c(2,2))
##D plot(pbc.gof, ci=TRUE, legend=NULL)
## End(Not run)



