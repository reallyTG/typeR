library(emdbook)


### Name: lambertW
### Title: Lambert W function
### Aliases: lambertW lWasymp lambertW_base
### Keywords: math

### ** Examples

curve(lambertW(x),from=0,to=10)
pvec <- seq(-1,1,length=40)
m <- outer(pvec,pvec,function(x,y)Re(lambertW(x+y*1i)))
persp(pvec,pvec,m,
      theta=290,shade=0.5,zlab="lambertW")
num1 <- uniroot(function(x) {x*exp(x)-1},lower=0,upper=1,tol=1e-9)
abs(lambertW(1)-num1$root)<1e-9
###
## Rogers random predator equation:
rogers.pred <- function(N0,a,h,T) {
   N0 - lambertW(a*h*N0*exp(-a*(T-h*N0)))/(a*h)
}
holling2.pred <- function(N0,a,h) {
  a*N0/(1+a*h*N0)
}
curve(rogers.pred(x,a=1,h=0.2,T=1),from=0,to=60,
  ylab="Number eaten/unit time",xlab="Initial number",ylim=c(0,5),
  main="Predation: a=1, h=0.2")
curve(rogers.pred(x,a=1,h=0.2,T=5)/5,add=TRUE,lty=2,from=0)
curve(rogers.pred(x,a=1,h=0.2,T=0.2)*5,add=TRUE,lty=3,from=0)
curve(rogers.pred(x,a=1,h=0.2,T=10)/10,add=TRUE,lty=4,from=0)
curve(holling2.pred(x,a=1,h=0.2),add=TRUE,lty=1,lwd=2,from=0)
abline(h=5)
legend(30,2,
   c(paste("Rogers, T=",c(0.2,1,5,10),sep=""),
    "Holling type II"),lwd=c(rep(1,4),2),lty=c(3,1,2,4,1))
## final size of an epidemic
finalsize <- function(R0) {
   1+1/R0*lambertW(-R0*exp(-R0))
}
curve(finalsize,from=1,to=10,xlab=expression(R[0]),ylab="Final size")
## comparison of asymptotic results
tmpf <- function(x) {
  L0 <- lambertW_base(10^x)
  L1 <- lWasymp(logz=x*log(10))
  (L1-L0)/L0
}
curve(tmpf,from=1,to=307,log="y")

## derivative
## don't run (avoid numDeriv dependency)
## require(numDeriv)
##   grad(lambertW(1))
##   plogis(-lambertW(1))



