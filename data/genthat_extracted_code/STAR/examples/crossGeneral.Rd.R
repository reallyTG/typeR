library(STAR)


### Name: crossGeneral
### Title: Computations of Boundary Crossing Probabilities for the Wiener
###   Process
### Aliases: crossGeneral crossTight mkTightBMtargetFct
###   print.FirstPassageTime summary.FirstPassageTime plot.FirstPassageTime
###   lines.FirstPassageTime
### Keywords: distribution htest

### ** Examples

## Not run: 
##D ## Reproduce Table 1 (p 101) of Loader and Deely (1987)
##D ## define a vector of n values
##D nLD <- c(8,16,32,64,128)
##D 
##D ## Part 1: c(t) = sqrt(1+t) and tMax=1
##D ## define cFct
##D cFT1p1 <- function(t) sqrt(1+t)
##D ## define the different bFct
##D bFT1p1.ii <- function(t) 0.5/sqrt(1+t)
##D bFT1p1.iii <- function(t) (cFT1p1(t)-cFT1p1(0))/t 
##D bFT1p1.iv <- function(t) 0.5*(bFT1p1.ii(t)+bFT1p1.iii(t)) 
##D bFT1p1.v <- function(t) (2*t-4/5*((1+t)^2.5-1))/t^3+3*cFT1p1(t)/2/t
##D ## Do the calculations
##D round(t(sapply(nLD,
##D                function(n) {
##D                  c(n=n,
##D                    i=crossGeneral(tMax=1,h=1/n,cFct=cFT1p1)$G[n],
##D                    ii=crossGeneral(tMax=1,h=1/n,cFct=cFT1p1,bFct=bFT1p1.ii)$G[n],
##D                    iii=crossGeneral(tMax=1,h=1/n,cFct=cFT1p1,bFct=bFT1p1.iii)$G[n],
##D                    iv=crossGeneral(tMax=1,h=1/n,cFct=cFT1p1,bFct=bFT1p1.iv)$G[n],
##D                    v=crossGeneral(tMax=1,h=1/n,cFct=cFT1p1,bFct=bFT1p1.v)$G[n])})),
##D       digits=6)
##D 
##D ## Part 2: c(t) = exp(-t) and tMax=1
##D ## define cFct
##D cFT1p2 <- function(t) exp(-t)
##D ## define the different bFct
##D cFT1p2 <- function(t) exp(-t)
##D bFT1p2.ii <- function(t) -exp(-t)
##D bFT1p2.iii <- function(t) (cFT1p2(t)-cFT1p2(0))/t 
##D bFT1p2.iv <- function(t) 0.5*(bFT1p2.ii(t)+bFT1p2.iii(t)) 
##D bFT1p2.v <- function(t) 3*(1-t-exp(-t))/t^3+3*cFT1p2(t)/2/t
##D ## Do the calculations
##D round(t(sapply(nLD,
##D                function(n) {
##D                  c(n=n,
##D                    i=crossGeneral(tMax=1,h=1/n,cFct=cFT1p2)$G[n],
##D                    ii=crossGeneral(tMax=1,h=1/n,cFct=cFT1p2,bFct=bFT1p2.ii)$G[n],
##D                    iii=crossGeneral(tMax=1,h=1/n,cFct=cFT1p2,bFct=bFT1p2.iii)$G[n],
##D                    iv=crossGeneral(tMax=1,h=1/n,cFct=cFT1p2,bFct=bFT1p2.iv)$G[n],
##D                    v=crossGeneral(tMax=1,h=1/n,cFct=cFT1p2,bFct=bFT1p2.v)$G[n])})),
##D       digits=6)
##D 
##D ## Part 3: c(t) = t^2 + 3*t + 1 and tMax=1
##D ## define cFct
##D cFT1p3 <- function(t) t^2+3*t+1
##D ## define the different bFct
##D bFT1p3.ii <- function(t) 2*t+3
##D bFT1p3.iii <- function(t) (cFT1p3(t)-cFT1p3(0))/t 
##D bFT1p3.v <- function(t) 5*t/4+3
##D bFT1p3.vi <- function(t) rep(3,length(t))
##D round(t(sapply(nLD,
##D                function(n) {
##D                  c(n=n,
##D                    i=crossGeneral(tMax=1,h=1/n,cFct=cFT1p3)$G[n],
##D                    ii=crossGeneral(tMax=1,h=1/n,cFct=cFT1p3,bFct=bFT1p3.ii)$G[n],
##D                    iii=crossGeneral(tMax=1,h=1/n,cFct=cFT1p3,bFct=bFT1p3.iii)$G[n],
##D                    v=crossGeneral(tMax=1,h=1/n,cFct=cFT1p3,bFct=bFT1p3.v)$G[n],
##D                    vi=crossGeneral(tMax=1,h=1/n,cFct=cFT1p3,bFct=bFT1p3.vi)$G[n])})),
##D       digits=6)
##D 
##D ## Part 3: c(t) = t^2 + 3*t + 1 and tMax=1
##D ## define cFct
##D cFT1p4 <- function(t) 1/t
##D ## Here only column (i) and (vii) are reproduced.
##D ## If one attempts to reproduce (ii) directly with crossGeneral
##D ## a NaN appears (when a -Inf is the correct value) in functions
##D ## F() and K(,) (see details) for instance when t=0 in F.
##D ## Then as crossGeneral is presently written R attempts to
##D ## compute t*b(t), where b(t) is c'(t), that is, t*(-1/t^2) which is
##D ## NaN (for R) when t=0.
##D bFT1p4.vii <- function(t) rep(-1,length(t))
##D round(t(sapply(nLD,
##D                function(n) {
##D                  c(n=n,
##D                    i=crossGeneral(tMax=1,h=1/n,cFct=cFT1p4)$G[n],
##D                    vii=crossGeneral(tMax=1,h=1/n,cFct=cFT1p4,bFct=bFT1p4.vii)$G[n])})),
##D       digits=6)
##D ## The last 3 rows of column (vii) are not the same as in the paper
##D 
##D ## Reproduce Table 4 (p 104) of Loader and Deely (1987)
##D ## As before the probability of first passage between
##D ## 0 and 1 is computed. This time only three boundary
##D ## functions are considered. The error bounds are
##D ## obtained
##D 
##D ## Part 1: c(t) = sqrt(1+t)
##D ## Left columns pair: b(t) = c'(t)
##D round(t(sapply(nLD,
##D                function(n) {
##D                  res <- crossGeneral(tMax=1,h=1/n,cFct=cFT1p1,bFct=bFT1p1.ii,withBounds=TRUE,Lplus=TRUE)
##D                  c(Gl=res$Gl[n],Gu=res$Gu[n])
##D                }
##D                )
##D          ),
##D        digits=5)
##D 
##D ## Right columns pair: b(t) = 0
##D round(t(sapply(nLD,
##D                function(n) {
##D                  res <- crossGeneral(tMax=1,h=1/n,cFct=cFT1p1,withBounds=TRUE,Lplus=TRUE)
##D                  c(n=n,Gl=res$Gl[n],Gu=res$Gu[n])
##D                }
##D                )
##D          ),
##D        digits=5)
##D 
##D ## Part 2: c(t) = t^2 + 3*t + 1
##D ## Left columns pair: b(t) = 3 - 2*t
##D round(t(sapply(nLD,
##D                function(n) {
##D                  res <- crossGeneral(tMax=1,h=1/n,cFct=cFT1p3,bFct=function(t) 3-2*t,withBounds=TRUE,Lplus=TRUE)
##D                  c(n=n,Gl=res$Gl[n],Gu=res$Gu[n])
##D                }
##D                )
##D          ),
##D        digits=5)
##D 
##D ## Right columns pair: b(t) = 3 - t
##D round(t(sapply(nLD,
##D                function(n) {
##D                  res <- crossGeneral(tMax=1,h=1/n,cFct=cFT1p3,bFct=function(t) 3-2*t,withBounds=TRUE,Lplus=TRUE)
##D                  c(n=n,Gl=res$Gl[n],Gu=res$Gu[n])
##D                }
##D                )
##D          ),
##D        digits=5)
##D 
##D ## Part 3: c(t) = 1 + sin(t)
##D ## Left columns pair: b(t) = c'(t)
##D round(t(sapply(nLD,
##D                function(n) {
##D                  res <- crossGeneral(tMax=1,h=1/n,cFct=function(t) 1+sin(t),bFct=function(t) cos(t),withBounds=TRUE,Lplus=TRUE)
##D                  c(n=n,Gl=res$Gl[n],Gu=res$Gu[n])
##D                }
##D                )
##D         ),
##D       digits=5)
##D 
##D ## Left columns pair: b(t) = 0.5
##D round(t(sapply(nLD,
##D                function(n) {
##D                  res <- crossGeneral(tMax=1,h=1/n,cFct=function(t) 1+sin(t),bFct=function(t) rep(0.5,length(t)),withBounds=TRUE,Lplus=TRUE)
##D                  c(n=n,Gl=res$Gl[n],Gu=res$Gu[n])
##D                }
##D                )
##D         ),
##D       digits=5)
##D 
##D 
##D ## Check crossGeneral against an analytical inverse Gaussian
##D ## distribution
##D ## Define inverse Gaussian parameters
##D mu.true <- 0.075
##D sigma2.true <- 3
##D ## Define a function transforming the "drift" (mu.true) and
##D ## "noise variance" (sigma2.true) of the default inverse
##D ## Gaussian parametrization of STAR into a
##D ## linear boundary of an equivalent Wiener process first
##D ## passage time problem
##D star2ld <- function(mu,sigma2) c(sqrt(1/sigma2),-sqrt(1/sigma2)/mu)
##D ## Get the "equivalent" boundary parameters (y intercept and slope)
##D parB1 <- star2ld(mu.true,sigma2.true)
##D ## Plot the "target" inverse Gaussian density
##D xx <- seq(0.001,0.3,0.001)
##D plot(xx,dinvgauss(xx,mu=mu.true,sigma2=sigma2.true),type="l")
##D ## Get the numerical estimate of the density using Loader and
##D ## Deely Volterra integral equation method
##D igB1 <- crossGeneral(tMax=0.3,h=0.001,cFct=function(t) parB1[1]+parB1[2]*t,withBounds=FALSE)
##D ## superpose the numerical estimate to the exact solution
##D ## use lines method to do that
##D lines(igB1,"density",col=2)
##D 
##D ## Use of crossTight and associated function
##D ## Get the paramters, a and b, of the "approximate"
##D ## tightest boundary: c(t) = a + b*sqrt(t), giving a 
##D ## 0.05 probability of exit between 0 and 1
##D ## (in fact we are discussing here a pair of symmetrical
##D ## bounaries, c(t) and -c(t)). See Kendall et al (2007)
##D ## for details
##D ## Start by defining the target function
##D target95 <- mkTightBMtargetFct(ci=0.95)
##D ## get the optimal log(a) and log(b) using
##D ## the values of table 1 of Kendall et al as initial
##D ## guesses
##D p95 <- optim(log(c(0.3,2.35)),target95,method="BFGS")
##D ## check the convergence of BFGS
##D p95$convergence
##D ## check if the parameters changed a lot
##D exp(p95$par)
##D ## Get the bounds on G(1) for these optimal parameters
##D d95 <- crossTight(a=exp(p95$par[1]),b=exp(p95$par[2]),withBound=TRUE,logScale=FALSE)
##D ## print out the summary
##D summary(d95)
##D ## Do the same for the 0.01 probability of first passage
##D target99 <- mkTightBMtargetFct(ci=0.99)
##D p99 <- optim(p95$par,target99,method="BFGS")
##D p99$convergence
##D exp(p99$par)
##D d99 <- crossTight(a=exp(p99$par[1]),b=exp(p99$par[2]),withBound=TRUE,logScale=FALSE)
##D summary(d99) 
## End(Not run)




