library(goftte)


### Name: prop.coxph
### Title: Checking proportional hazards assumption for Cox model
### Aliases: prop.coxph prop

### ** Examples

require(survival)
  
#Simulating survival data
simcox <- function(n=100, seed=1) {
  if (!is.null(seed))
  set.seed(seed)
  time<-rexp(n); cen<-2*rexp(n);
  status<-(time<cen);
  time[status==0]<-cen[status==0];
  X<-matrix(rnorm(2*n),n,2)
  return(data.frame(time=time, status=status, X))
}
n <- 100; d <- simcox(n); 
  
#Fitting Cox's model
fit.coxph <- coxph(Surv(time,status)~ X1 + X2, data=d)
  
#Checking the proportional hazards assumption
prop(fit.coxph) 



