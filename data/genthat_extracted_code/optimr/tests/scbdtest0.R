rm(list=ls())
# fname<-paste(format(Sys.time(), "%Y%m%d%H%M"),"-btRvmmin.out",sep='')
# sink(fname, append=TRUE, split=TRUE)
require("optimr")
#####################

# This test script illustrates the use of bounds in optimr()
# where there is significant variation in the scaling of the parameters.

sfactor <- 4.0

# Scaled bounds test
sbt.f<-function(x){
 nn <- length(x)
 y <- sfactor^(0:(nn - 1))
 sum((x - y)^2)
}

sbt.g<-function(x){
  nn <- length(x)
 y <- sfactor^(0:(nn - 1))
  gg<-2.0*(x - y)
}

n<-4
lower<-rep(0,n)
upper<-lower # to get arrays set
bdmsk<-rep(1,n)
y <- sfactor^(0:(n - 1))
upper <- 0.8*y # to force active constraints

xx <- lower + 0.1*(lower + upper) # start a bit up from lower bounds

cat("Rvmmin \n\n")

abtrvm <- optimr(xx, sbt.f, sbt.g, lower, upper, method="Rvmmin", control=list(trace=1))
print(abtrvm)

alb<-optimr(xx, sbt.f, sbt.g, lower=lower, upper=upper, method="L-BFGS-B", control=list(trace=1))
print(alb)

sabtrvm <- optimr(xx, sbt.f, sbt.g, lower, upper, method="Rvmmin", control=list(trace=1, parscale=c(1,4,16,32)))
print(sabtrvm)

salb<-optimr(xx, sbt.f, sbt.g, lower=lower, upper=upper, method="L-BFGS-B", control=list(trace=1, parscale=c(1,4,16,32)))
print(salb)


alkkt <- optextras::kktchk(alb$par, sbt.f, sbt.g, hess=NULL, upper=upper, lower=lower,  maxfn=FALSE,  control=list(trace=1))
print(alkkt)

salkkt <- optextras::kktchk(salb$par, sbt.f, sbt.g, hess=NULL, upper=upper, lower=lower,  maxfn=FALSE,  control=list(trace=1))
print(salkkt)

aallbd <- opm(xx, sbt.f, sbt.g, lower=lower, upper=upper, method="ALL", control=list(trace=0))
print(aallbd)

saallbd <- opm(xx, sbt.f, sbt.g, lower=lower, upper=upper, method="ALL", control=list(trace=0, parscale=c(1,4,16,32)))
print(saallbd)



#sink()
