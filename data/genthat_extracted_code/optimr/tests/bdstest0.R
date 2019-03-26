rm(list=ls())
# fname<-paste(format(Sys.time(), "%Y%m%d%H%M"),"-btRvmmin.out",sep='')
# sink(fname, append=TRUE, split=TRUE)
require("optimr")
#####################

# This test script illustrates the use of bounds in optimr() with the
# optimizers Rvmmin and L-BFGS-B, as well as a Kuhn Karush Tucker check 
# on the final parameters from the second optimization.
# Masks are tested at the very end for the two methods for which they are
# available. Note that they must be called via the opm() function.


# Simple bounds test for n=4
bt.f<-function(x){
 sum(x*x)
}

bt.g<-function(x){
  gg<-2.0*x
}

n<-4
lower<-rep(0,n)
upper<-lower # to get arrays set
bdmsk<-rep(1,n)
# bdmsk[(trunc(n/2)+1)]<-0
for (i in 1:n) { 
    lower[i]<-1.0*(i-1)*(n-1)/n
    upper[i]<-1.0*i*(n+1)/n
}
xx<-0.5*(lower+upper)

cat("Rvmmin \n\n")

abtrvm <- optimr(xx, bt.f, bt.g, lower, upper, method="Rvmmin", control=list(trace=4))
print(abtrvm)

alb<-optimr(xx,bt.f, bt.g, lower=lower, upper=upper, method="L-BFGS-B", control=list(trace=3))
print(alb)

alhn<-optimr(xx, bt.f, lower=lower, upper=upper, method="hjn", control=list(trace=3))

alkkt <- optextras::kktchk(alb$par, bt.f, bt.g, hess=NULL, upper=upper, lower=lower,  maxfn=FALSE, control=list(trace=1))
print(alkkt)


#sink()
cat("All bounded methods attempt with opm\n")

allbds <- opm(xx, bt.f, bt.g, lower=lower, upper=upper, method="ALL", control=list(trace=1))
summary(allbds, order=value)

cat("Now force a mask upper=lower for parameter 3 and see what happens\n")
upper[3] <- lower[3]
xx[3] <- lower[3] # MUST reset parameter also

allbdm <- opm(xx, bt.f, bt.g, lower=lower, upper=upper, method="ALL", control=list(trace=1))
summary(allbdm, order=value)




