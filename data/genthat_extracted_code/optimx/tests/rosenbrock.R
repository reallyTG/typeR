## rosenbrock.R -- tests inspired by the 
## Rosenbrock banana shaped valley
rm(list=ls())
require(optimx)

#Rosenbrock banana valley function -- original
f2 <- function(x){
  return(100*(x[2] - x[1]*x[1])^2 + (1-x[1])^2)
}
#gradient
g2 <- function(x){
  return(c(-400*x[1]*(x[2] - x[1]*x[1]) - 2*(1-x[1]), 200*(x[2] - x[1]*x[1])))
}
#Hessian
h2 <- function(x) {
  a11 <- 2 - 400*x[2] + 1200*x[1]*x[1]; a21 <- -400*x[1]
  return(matrix(c(a11, a21, a21, 200), 2, 2))
}


# we can also use nlm and nlminb
fgh2 <- function(x){
  ## combine f, g and h into single function for nlm
  ff <- f2(x)
  gg <- g2(x)
  hh <- h2(x)
  attr(ff, "gradient") <- gg
  attr(ff, "hessian") <- hh
  ff
}


XRosenbrock.f <- function (x) 
{
    n <- length(x)
    x1 <- x[2:n]
    x2 <- x[1:(n - 1)]
    sum(100 * (x1 - x2^2)^2 + (1 - x2)^2)
}
XRosenbrock.g <- function (x) 
{
    n <- length(x)
    g <- rep(NA, n)
    g[1] <- 2 * (x[1] - 1) + 400 * x[1] * (x[1]^2 - x[2])
    if (n > 2) {
        ii <- 2:(n - 1)
        g[ii] <- 2 * (x[ii] - 1) + 400 * x[ii] * (x[ii]^2 - x[ii + 
            1]) + 200 * (x[ii] - x[ii - 1]^2)
    }
    g[n] <- 200 * (x[n] - x[n - 1]^2)
    g
}

# genrose function code 
# A different generalization of the Rosenbrock banana valley function 
# -- attempts to match the rosenbrock at gs=100 and x=c(-1.2,1)
genrose.f<- function(x, gs=NULL){ # objective function
	n <- length(x)
        if(is.null(gs)) { gs=100.0 }
        # Note do not at 1.0 so min at 0
	fval<-sum (gs*(x[1:(n-1)]^2 - x[2:n])^2 + (x[1:(n-1)] - 1)^2)
}

genrose.g <- function(x, gs=NULL){
# vectorized gradient for genrose.f
# Ravi Varadhan 2009-04-03
	n <- length(x)
        if(is.null(gs)) { gs=100.0 }
	gg <- as.vector(rep(0, n))
	tn <- 2:n
	tn1 <- tn - 1
	z1 <- x[tn] - x[tn1]^2
	z2 <- 1 - x[tn1]
        # f = gs*z1*z1 + z2*z2
	gg[tn] <- 2 * (gs * z1)
	gg[tn1] <- gg[tn1] - 4 * gs * x[tn1] * z1 - 2 *z2 
	return(gg)
}

genrose.h <- function(x, gs=NULL) { ## compute Hessian
   if(is.null(gs)) { gs=100.0 }
	n <- length(x)
	hh<-matrix(rep(0, n*n),n,n)
	for (i in 2:n) {
		z1<-x[i]-x[i-1]*x[i-1]
#		z2<-1.0 - x[i-1] # Not needed
                hh[i,i]<-hh[i,i]+2.0*(gs+1.0)
                hh[i-1,i-1]<-hh[i-1,i-1]-4.0*gs*z1-4.0*gs*x[i-1]*(-2.0*x[i-1])
                hh[i,i-1]<-hh[i,i-1]-4.0*gs*x[i-1]
                hh[i-1,i]<-hh[i-1,i]-4.0*gs*x[i-1]
	}
        return(hh)
}

cat("Standard start, original function -- single methods\n\n")
xstart <- c(-1.2,1)


sn1 <- snewton(xstart, fn=f2, gr=g2, hess=h2, control=list(trace=0))
print(sn1)

cat("This should be fast, but is not. Why?\n")
t1nlm <- nlm(f=fgh2, xstart, hessian=TRUE, print.level=2)
print(t1nlm)

cat("It looks like nlminb is using a Newton-type method\n")
t1nlminb <- nlminb(xstart, f2, gradient=g2, hessian=h2, control=list(trace=1))
print(t1nlminb)
cat("But try without the hessian specified\n")
t1anlminb <- nlminb(xstart, f2, gradient=g2, hessian=NULL, control=list(trace=1))
print(t1nlminb)

# and call them from optimx package 

# Same result for nlm

t1nlmo <- optimr(xstart, f2, g2, hess=h2, method="nlm", control=list(trace=1))
print(t1nlmo)

# Same result for nlminb
t1nlminbo <- optimr(xstart, f2, g2, hess=h2, method="nlminb", control=list(trace=1))
print(t1nlminbo)

cat("\n\n Now use XRosenbrock and genrose functions\n")

cat("XRrosenbrock.f(xstart)=",XRosenbrock.f(xstart),"\n")
cat("genrose.f(xstart)=",genrose.f(xstart),"\n")

aX2<-optimr(xstart, XRosenbrock.f, XRosenbrock.g, method="Rvmmin")
print(aX2)
aX2.target <- structure(list(par = c(1, 1), value = 0, counts = structure(c(59, 
39), .Names = c("function", "gradient")), convergence = 2, 
message = "Rvmminu appears to have converged"), .Names = c("par", 
"value", "counts", "convergence", "message"))
all.equal(aX2, aX2.target)

ag2<-optimr(xstart, genrose.f, genrose.g, method="Rvmmin")
print(ag2)
all.equal(ag2, aX2.target)

# Newton methods fail with no hessian
cat("All methods via opm -- no hessian\n")
aX2all <- opm(xstart, XRosenbrock.f, XRosenbrock.g, method="ALL", control=list(kkt=FALSE))
aX2all.sum <- summary(aX2all, order=value)
print(aX2all.sum)

ag2all <- opm(xstart, genrose.f, genrose.g, hess=genrose.h, method="ALL", control=list(kkt=FALSE))
ag2all.sum <- summary(ag2all, order=value)
print(ag2all.sum)


cat("\n \n Different set of all methods via optimx -- no hessian")
aX2allx <- optimx(xstart, XRosenbrock.f, XRosenbrock.g, control=list(all.methods=TRUE, kkt=FALSE))
aX2allx.sum <- summary(aX2allx, order=value)
print(aX2allx.sum)
# ?? lbfgsb3 fails in optimx

ag2allx <- optimx(xstart, genrose.f, genrose.g, control=list(all.methods=TRUE, kkt=FALSE))
ag2allx.sum <- summary(ag2allx, order=value)
print(ag2allx.sum)
# ?? lbfgsb3 fails in optimx

cat("Note things are different for n>2\n\n")

# analytic gradient test
xx<-rep(pi,5)
print(xx)
lower<-NULL
upper<-NULL
bdmsk<-NULL # Not used in optimr
cat("XRrosenbrock.f(xx)=",XRosenbrock.f(xx),"\n")
cat("genrose.f(xx)=",genrose.f(xx),"\n")

genrosea<-optimr(xx,genrose.f, genrose.g, method="Rvmmin", gs=10)
cat("genrosea uses analytic gradient\n")
print(genrosea)
cat("genrosenf uses grfwd standard numerical gradient\n")
genrosenf<-optimr(xx,genrose.f, gr="grfwd", method="Rvmmin", gs=10) # use local numerical gradient
print(genrosenf)
cat("genrosenullgr has no gradient specified\n")
genrosenullgr<-optimr(xx,genrose.f, method="Rvmmin", gs=10) # no gradient specified
print(genrosenullgr)

cat("timings direct call Bounded vs Unbounded\n")
# require(Rvmmin) # for direct call
xx<-rep(pi,50)
lo<-rep(-10000,50) # Bounds are activated if much smaller
up<-rep(10000,50)
bdmsk<-rep(1,50) # Used in Rvmmin, not in optimr
#tb<-system.time(ab<-Rvmminb(xx,genrose.f, genrose.g, lower=lo, upper=up, bdmsk=bdmsk, gs=10))[1]
#tu<-system.time(au<-Rvmminu(xx,genrose.f, genrose.g, gs=10))[1]
tb<-system.time(ab<-optimr(xx,genrose.f, genrose.g, lower=lo, upper=up, method="Rvmmin", gs=10))[1]
tu<-system.time(au<-optimr(xx,genrose.f, genrose.g, method="Rvmmin", gs=10))[1]
cat("times U=",tu,"   B=",tb,"\n")
cat("solution Rvmminu\n")
print(au)
cat("solution Rvmminb\n")
print(ab)
cat("diff fu-fb=",au$value-ab$value,"\n")
cat("max abs parameter diff = ", max(abs(au$par-ab$par)),"\n")

#####################
cat("test bounds and masks\n")
nn<-4
startx<-rep(pi,nn)
lo<-rep(2,nn)
up<-rep(10,nn)
grbds1 <- optimr(startx,genrose.f, genrose.g, lower=lo, upper=up, method="Rvmmin") 
print(grbds1)

cat("test lower bound only\n")
nn<-4
startx<-rep(pi,nn)
lo<-rep(2,nn)
grbds2<-optimr(startx,genrose.f, genrose.g, lower=lo, method="Rvmmin") 
print(grbds2)

cat("test lower bound single value only\n")
nn<-4
startx<-rep(pi,nn)
lo<-2
up<-rep(10,nn)
grbds3<-optimr(startx,genrose.f, genrose.g, lower=lo, method="Rvmmin") 
print(grbds3)

cat("test upper bound only\n")
nn<-4
startx<-rep(pi,nn)
up<-rep(10,nn)
grbds4<-optimr(startx,genrose.f, genrose.g, upper=up, method="Rvmmin") 
print(grbds4)

cat("test upper bound single value only\n")
nn<-4
startx<-rep(2,nn)
grbds5<-optimr(startx,genrose.f, genrose.g, upper=2, method="Rvmmin") 
print(grbds5)


cat("test masks only\n")
nn<-6
lo <- c(-1000, -1000, 2, 2, -1000, -1000)
up <- c(1000, 1000, 2, 2, 1000, 1000) # mid two values equal
bd<-c(1,1,0,0,1,1) # NOT used
startx<-c(pi, pi, 2, 2, pi, pi)
grbds6<-optimr(startx,genrose.f, genrose.g, lower=lo, upper=up, method="Rvmmin") 
print(grbds6)

cat("test upper bound on first two elements only\n")
nn<-4
startx<-rep(pi,nn)
upper<-c(10,8, Inf, Inf)
grbds7<-optimr(startx,genrose.f, genrose.g, upper=upper, method="Rvmmin") 
print(grbds7)


cat("test lower bound on first two elements only\n")
nn<-4
startx<-rep(0,nn) # NOTE: Will not work because of bounds and initial parameters ??
startx <- c(pi, 1.1, pi, pi)
lower<-c(0, 1.1, -Inf, -Inf)
grbds8<-optimr(startx,genrose.f,genrose.g,lower=lower, method="Rvmmin", control=list(maxit=2000)) 
print(grbds8)

#####################
