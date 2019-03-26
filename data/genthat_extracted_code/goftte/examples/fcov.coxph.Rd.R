library(goftte)


### Name: fcov.coxph
### Title: Checking the functional form assumption for Cox model
### Aliases: fcov.coxph fcov

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
  
#Fitting Cox model
fit.coxph <- coxph(Surv(time,status)~ X1 + X2, data=d)
  
#Checking the covariates functional form assumption
fcov(fit.coxph) 



