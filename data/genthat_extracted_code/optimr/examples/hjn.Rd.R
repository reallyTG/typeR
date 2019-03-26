library(optimr)


### Name: hjn
### Title: Compact R Implementation of Hooke and Jeeves Pattern Search
###   Optimization
### Aliases: hjn
### Keywords: nonlinear optimize

### ** Examples

#####################
## Rosenbrock Banana function
fr <- function(x) {
    x1 <- x[1]
    x2 <- x[2]
    100 * (x2 - x1 * x1)^2 + (1 - x1)^2
}

ansrosenbrock0 <- hjn(fn=fr, par=c(1,2), control=list(maxfeval=2000, trace=0))
print(ansrosenbrock0) # use print to allow copy to separate file that 
#    can be called using source()
#####################
# Simple bounds and masks test
bt.f<-function(x){
 sum(x*x)
}

n<-10
xx<-rep(0,n)
lower<-rep(0,n)
upper<-lower # to get arrays set
bdmsk<-rep(1,n)
bdmsk[(trunc(n/2)+1)]<-0
for (i in 1:n) { 
   lower[i]<-1.0*(i-1)*(n-1)/n
   upper[i]<-1.0*i*(n+1)/n
}
xx<-0.5*(lower+upper)
ansbt<-hjn(xx, bt.f, lower, upper, bdmsk, control=list(trace=1, maxfeval=2000))

print(ansbt)

#####################
genrose.f<- function(x, gs=NULL){ # objective function
## One generalization of the Rosenbrock banana valley function (n parameters)
	n <- length(x)
        if(is.null(gs)) { gs=100.0 }
	fval<-1.0 + sum (gs*(x[1:(n-1)]^2 - x[2:n])^2 + (x[2:n] - 1)^2)
        return(fval)
}

xx<-rep(pi,10)
lower<-NULL
upper<-NULL
bdmsk<-NULL
genrosea<-hjn(xx,genrose.f, control=list(maxfeval=2000), gs=10)
print(genrosea)

cat("timings B vs U\n")
lo<-rep(-100,10)
up<-rep(100,10)
bdmsk<-rep(1,10)
tb<-system.time(ab<-hjn(xx,genrose.f, lower=lo, upper=up,
          bdmsk=bdmsk, control=list(trace=0, maxfeval=2000)))[1]
tu<-system.time(au<-hjn(xx,genrose.f, control=list(maxfeval=2000, trace=0)))[1]
cat("times U=",tu,"   B=",tb,"\n")
cat("solution hjnu\n")
print(au)
cat("solution hjnb\n")
print(ab)
cat("diff fu-fb=",au$value-ab$value,"\n")
cat("max abs parameter diff = ", max(abs(au$par-ab$par)),"\n")

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

# cat("test that maximize=TRUE works correctly\n")
# 160706 -- not set up to maximize yet, except through optimr perhaps

#n<-6
#xx<-rep(1,n)
#ansmax<-hjn(xx,maxfn, control=list(maximize=TRUE,trace=1, maxfeval=2000))
#print(ansmax)

#cat("using the negmax function should give same parameters\n")
#ansnegmax<-hjn(xx,negmaxfn, control=list(trace=1))
#print(ansnegmax)


#####################  From Rvmmin.Rd
cat("test bounds and masks\n")
nn<-4
startx<-rep(pi,nn)
lo<-rep(2,nn)
up<-rep(10,nn)
grbds1<-hjn(startx,genrose.f, lower=lo,upper=up, control=list(maxfeval=2000, trace=0)) 
print(grbds1)

cat("test lower bound only\n")
nn<-4
startx<-rep(pi,nn)
lo<-rep(2,nn)
grbds2<-hjn(startx,genrose.f, lower=lo) 
print(grbds2)

cat("test lower bound single value only\n")
nn<-4
startx<-rep(pi,nn)
lo<-2
up<-rep(10,nn)
grbds3<-hjn(startx,genrose.f, lower=lo) 
print(grbds3)

cat("test upper bound only\n")
nn<-4
startx<-rep(pi,nn)
lo<-rep(2,nn)
up<-rep(10,nn)
grbds4<-hjn(startx,genrose.f, upper=up, control=list(maxfeval=2000)) 
print(grbds4)

cat("test upper bound single value only\n")
nn<-4
startx<-rep(pi,nn)
grbds5<-hjn(startx,genrose.f, upper=10, control=list(maxfeval=2000)) 
print(grbds5)



cat("test masks only\n")
nn<-6
bd<-c(1,1,0,0,1,1)
startx<-rep(pi,nn)
grbds6<-hjn(startx,genrose.f, bdmsk=bd, control=list(maxfeval=2000)) 
print(grbds6)

cat("test upper bound on first two elements only\n")
nn<-4
startx<-rep(pi,nn)
upper<-c(10,8, Inf, Inf)
grbds7<-hjn(startx,genrose.f, upper=upper, control=list(maxfeval=2000)) 
print(grbds7)


cat("test lower bound on first two elements only\n")
nn<-4
startx<-rep(0,nn)
lower<-c(0, -0.1 , -Inf, -Inf)
grbds8a<-hjn(startx,genrose.f, lower=lower, control=list(maxfeval=2000)) 
print(grbds8a)

cat("test n=1 problem using simple squares of parameter\n")

sqtst<-function(xx) {
   res<-sum((xx-2)*(xx-2))
}

######### One dimension test
nn<-1
startx<-rep(0,nn)
onepar<-hjn(startx,sqtst,control=list(trace=1)) 
print(onepar)





