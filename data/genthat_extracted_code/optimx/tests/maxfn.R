require(optimx)
maxfn<-function(x) {
  n<-length(x)
  ss<-seq(1,n)
  f<-10-(crossprod(x-ss))^2
  f<-as.numeric(f)
  return(f)
}


negmaxfn<-function(x) {
  f<-(-1)*maxfn(x)
  return(f)
}

cat("test that maximize=TRUE works correctly\n")

n<-6
xx<-rep(1,n)
ansmax<-optimr(xx,maxfn, gr="grfwd", method="Rvmmin", control=list(maximize=TRUE,trace=0))
print(ansmax)

amaxkkt <- kktchk(ansmax$par, maxfn, gr="grfwd", hess=NULL,  maximize=TRUE, control=list(trace=0))
print(amaxkkt)


cat("using the negmax function should give same parameters\n")
ansnegmax<-optimr(xx,negmaxfn, gr="grfwd",  method="Rvmmin", control=list(trace=0))
print(ansnegmax)

# Test Carlo Lapid suggested fix for optimr()  180313

amaxo<-optimr(xx, maxfn, method="L-BFGS-B", control=list(maximize=TRUE, trace=0))
print(amaxo)

cat("using the negmax function should give same parameters\n")
anegmaxo<-optimr(xx,negmaxfn, method="L-BFGS-B", control=list(trace=0))
print(anegmaxo)

cat("WARNING -- this example should FAIL\n")
cat("maximize=TRUE is NOT set up in hjn()\n")
# 160706 -- not set up to maximize, except through optimr perhaps
n<-6
xx<-rep(1,n)
ansmax<-try(hjn(xx,maxfn, control=list(maximize=TRUE,trace=1, maxit=10, maxfeval=2000)))
print(ansmax)

cat("\nTry to maximize through optimr()\n")
ansmaxo<-try(optimr(xx,maxfn, method="hjn", control=list(maximize=TRUE,trace=1, maxit=10, maxfeval=2000)))
print(ansmaxo)

cat("using the negmax function should give same parameters\n")
ansnegmax<-hjn(xx,negmaxfn, control=list(trace=1, maxit=10, maxfeval=2000))
print(ansnegmax)

