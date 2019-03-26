rm(list=ls())
# fname<-paste(format(Sys.time(), "%Y%m%d%H%M"),"-btRvmmin.out",sep='')
# sink(fname, append=TRUE, split=TRUE)
require("optimx")
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

cat("lower bounds:")
print(lower)
cat("start:       ")
print(xx)
cat("upper bounds:")
print(upper)

cat("Rvmmin \n\n")
# Note: trace set to 0 below. Change as needed to view progress. 

abtrvm <- optimr(xx, bt.f, bt.g, lower=lower, upper=upper, method="Rvmmin", control=list(trace=0))
# Note: use lower=lower etc. because there is a missing hess= argument
print(abtrvm)

cat("Axial search")
axabtrvm <- axsearch(abtrvm$par, fn=bt.f, fmin=abtrvm$value, lower, upper, bdmsk=NULL, 
              trace=0)
print(axabtrvm)

cat("Now force an early stop\n")
abtrvm1 <- optimr(xx, bt.f, bt.g, lower=lower, upper=upper, method="Rvmmin", 
                  control=list(maxit=1, trace=0))
print(abtrvm1)
cat("Axial search")
axabtrvm1 <- axsearch(abtrvm1$par, fn=bt.f, fmin=abtrvm1$value, lower, upper, bdmsk=NULL, 
                     trace=0)
print(axabtrvm1)


cat("Maximization test\n")
mabtrvm <- optimr(xx, bt.f, bt.g, lower=lower, upper=upper, method="Rvmmin", 
                 control=list(trace=1, maximize=TRUE))
# Note: use lower=lower etc. because there is a missing hess= argument
print(mabtrvm)
cat("Do NOT try axsearch() with maximize\n")
cat("KKT condition check\n")
akktm <- kktchk(mabtrvm$par, bt.f, bt.g, hess=NULL, upper=upper, lower=lower,  maximize=TRUE, control=list(trace=0))
print(akktm)




alb<-optimr(xx,bt.f, bt.g, lower=lower, upper=upper, method="L-BFGS-B", 
            control=list(trace=0))
print(alb)

cat("KKT condition check\n")
alkkt <- kktchk(alb$par, bt.f, bt.g, hess=NULL, upper=upper, lower=lower,  maximize=FALSE, control=list(trace=0))
print(alkkt)

alhn<-optimr(xx, bt.f, lower=lower, upper=upper, method="hjn", 
             control=list(trace=0))
print(alhn)

#sink()
cat("All bounded methods attempt with opm\n")

allbds <- opm(xx, bt.f, bt.g, lower=lower, upper=upper, method="ALL", control=list(trace=0))
print(summary(allbds, order=value))

cat("Now force a mask upper=lower for parameter 3 and see what happens\n")
lower[3] <- upper[3]
xx[3] <- lower[3] # MUST reset parameter also

allbdm <- opm(xx, bt.f, bt.g, lower=lower, upper=upper, method="ALL", control=list(trace=0))
print(summary(allbdm, order=value))

