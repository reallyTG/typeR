library(mstate)


### Name: msboot
### Title: Bootstrap function in multi-state models
### Aliases: msboot
### Keywords: datagen

### ** Examples

tmat <- trans.illdeath()
data(ebmt1)
covs <- c("score","yrel")
msebmt <- msprep(time=c(NA,"rel","srv"),status=c(NA,"relstat","srvstat"),
		data=ebmt1,id="patid",keep=covs,trans=tmat)
# define a function (this one returns vector of regression coef's)
regcoefvec <- function(data) {
  cx <- coxph(Surv(Tstart,Tstop,status)~score+strata(trans),
          data=data,method="breslow")
  return(coef(cx))
}
regcoefvec(msebmt)
set.seed(1234)
msboot(theta=regcoefvec,data=msebmt,id="patid")



