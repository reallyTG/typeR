## ----knitRPreparations,include=FALSE-------------------------------------
library(knitr)
opts_chunk$set(tidy=FALSE)

## ----echo = FALSE, results = "hide"--------------------------------------
## preparation: set option withSweave to TRUE
require(distrTEst)
require(distrEx)
require(distrTeach)
require(distrMod)
distroptions(withSweave = TRUE)
options("newDevice" = TRUE)

## ----exam1, eval = TRUE, fig.width=8.0, fig.height=4.5-------------------
require(distr)
N <- Norm(mean = 2, sd = 1.3)
P <- Pois(lambda = 1.2)
Z <- 2*N + 3 + P
Z
plot(Z)
p(Z)(0.4)
q(Z)(0.3)
## in RStudio or Jupyter IRKernel, use q.l(.)(.) instead of q(.)(.)
Zs <- r(Z)(50)
Zs

## ----DiscrDist, eval = TRUE----------------------------------------------
D <- DiscreteDistribution(supp = c(1,5,7,21), prob = c(0.1,0.1,0.6,0.2))
D
plot(D)

## ----AbscDist, eval = TRUE-----------------------------------------------
AC <- AbscontDistribution(d = function(x) exp(-abs(x)^3), withStand = TRUE)
AC
plot(AC)

## ----examLis, eval = TRUE------------------------------------------------
library(distr)
M1 <- UnivarMixingDistribution(Norm(), Pois(lambda=1), Norm(), 
      withSimplify = FALSE)
M2 <- UnivarMixingDistribution(M1, Norm(), M1, Norm(), withSimplify = FALSE)
M2

## ----warningArith, eval = TRUE-------------------------------------------
  A1 <- Norm(); A2 <- Unif()
  A1 + A2

## ----examdcP, eval = TRUE------------------------------------------------
decomposePM(Norm())
     decomposePM(Binom(2,0.3)-Binom(5,.4))
     decomposePM(UnivarLebDecDistribution(Norm(),Binom(2,0.3)-Binom(5,.4), 
                 acWeight = 0.3))

## ----examflat, eval = TRUE-----------------------------------------------
D1 <- Norm()
D2 <- Pois(1)
D3 <- Binom(1,.4)
D4 <- UnivarMixingDistribution(D1,D2,D3, mixCoeff = c(0.4,0.5,0.1), 
      withSimplify = FALSE)
D <- UnivarMixingDistribution(D1,D4,D1,D2, mixCoeff = c(0.4,0.3,0.1,0.2), 
      withSimplify = FALSE)
D
D0<-flat.mix(D)
D0

## ----arithmetic, eval = TRUE---------------------------------------------
  A1 <- Norm(); A2 <- Unif()
  d(sin(A1 + A2))(0.1)
  d(sin(A1 + A2))(0.1)
  sin(A1 + A2)

## ----arith2v1, eval = TRUE-----------------------------------------------
  A1 <- Norm(); A2 <- Unif()
  A1A2 <- A1*A2
  plot(A1A2)

## ----arith2v2, eval = TRUE-----------------------------------------------
  A12 <- 1/(A2 + .3)
  plot(A12) 

## ----arith2v3, eval = TRUE-----------------------------------------------
  B <- Binom(5,.2)+1
  A1B <- A1^B
  plot(A1B, xlim=c(-3,3))

## ----arith2v4------------------------------------------------------------
  plot(1.2^A1)

## ----arith2v5------------------------------------------------------------
  plot(B^A1)

## ----Hub, eval = TRUE----------------------------------------------------
H <- Huberize(Norm(),lower=-1,upper=2)
plot(H)

## ----Trun, eval = TRUE---------------------------------------------------
T <- Truncate(Norm(),lower=-1,upper=2)
plot(T)

## ----Min1, eval = TRUE---------------------------------------------------
M1 <- Maximum(Unif(0,1), Minimum(Unif(0,1), Unif(0,1)))
plot(M1)

## ----Min2, eval = TRUE---------------------------------------------------
M2 <- Minimum(Exp(4),4)
plot(M2)

## ----Min3, eval = TRUE---------------------------------------------------
M3 <- Minimum(Norm(2,2), Pois(3))
plot(M3)

## ----TruncExtr, eval = TRUE----------------------------------------------
N <- Norm()
TN <- Truncate(N, 20,22)
r(TN)(20)  ## simulation accurate although :
p(N)(20, lower.tail = FALSE) ## prob that N>=20 

## ----qrex, eval = TRUE---------------------------------------------------
B <- Binom(5,0.5)
p(B)(3)
p.l(B)(3)
q(B)(.5)
q.r(B)(0.5)

## ----probHN, eval = TRUE-------------------------------------------------
B0 <- as(Binom(5,0.5),"DiscreteDistribution")
   ## coercion necessary:
   ## otherwise slot "prob" of B0 will be returned
prob(B0)
HN <- Huberize(N, -2,1)
prob(HN)

## ----makeAC, eval = TRUE-------------------------------------------------
par(mfrow=c(2,3))
plot(makeAbscontDistribution(Nbinom(5,.5)),mfColRow=FALSE)
plot(makeAbscontDistribution(HN),mfColRow=FALSE)
par(mfrow=c(1,1))

## ----getLowUp, eval = TRUE-----------------------------------------------
getLow(Nbinom(5,0.5))
getUp(Nbinom(5,0.5))
getLow(Norm(5,0.5))
getUp(Norm(5,0.5))

## ----cauchy1, eval = TRUE------------------------------------------------
  plot(Cauchy())

## ----cauchy2, eval = TRUE------------------------------------------------
  plot(Cauchy(),xlim=c(-4,4))

## ----plotex1, eval = TRUE, fig.width=8.0, fig.height=4.5-----------------
plot(Binom(size = 4, prob = 0.3))

## ----plotex2, eval = TRUE, fig.width=8.0, fig.height=4.5-----------------
plot(Binom(size = 4, prob = 0.3), do.points = FALSE, verticals = FALSE)

## ----plotex3, eval = TRUE, fig.width=8.0, fig.height=4.5-----------------
plot(Binom(size = 4, prob = 0.3), main = TRUE, inner = FALSE, cex.main = 1.6,
     tmar = 6)

## ----plotex4, eval = TRUE, fig.width=8.0, fig.height=4.5-----------------
plot(Binom(size = 4, prob = 0.3), cex.points = 1.2, pch = 20, lwd = 2)

## ----plotex5, eval = TRUE, fig.width=8.0, fig.height=4.5-----------------
B <- Binom(size = 4, prob = 0.3)
plot(B, col="red", col.points = "green", main = TRUE, col.main="blue",
     col.sub = "orange", sub = TRUE, cex.sub = 0.6, col.inner = "brown")

## ----plotex6, eval = TRUE, fig.width=8.0, fig.height=4.5-----------------
plot(Nbinom(size = 4,prob = 0.3), cex.points = 1.2, pch.u = 20, pch.a = 10)

## ----plotex7, eval = TRUE, fig.width=8.0, fig.height=4.5-----------------
plot(Chisq(), log = "xy", ngrid = 100)

## ----plotex8, eval = TRUE, fig.width=8.0, fig.height=4.5-----------------
plot(Norm(), lwd=3, col = "red", ngrid = 200, lty = 3, las = 2)

## ----plotex9, eval = TRUE, fig.width=8.0, fig.height=4.5-----------------
plot(Norm(), panel.first = grid(), main = "my Distribution: %A",
     inner = list(expression(paste(lambda, "-density of %C(%P)")), "CDF",
                  "Pseudo-inverse with param's %N"),
     sub = "this plot was correctly generated on %D",
     cex.inner = 0.9, cex.sub = 0.8)

## ----plotex10, eval = TRUE, fig.width=8.0, fig.height=4.5----------------
Ch <- Chisq(); setgaps(Ch, exactq = 3)
plot(Ch, cex = 1.2, pch.u = 20, pch.a = 10, col.points = "green", 
     col.vert = "red")

## ----plotex11, eval = TRUE, fig.width=8.0, fig.height=8.0----------------
layout(matrix(c(1,3,2,3), nrow=2))
plot(N, mfColRow = FALSE)

## ----plotex12, eval = TRUE, fig.width=8.0, fig.height=8.0----------------
layout(matrix(c(rep(1,6),2,2,3,3,4,4,5,5,5,6,6,6), 
                   nrow=3, byrow=TRUE))
plot(HN, mfColRow = FALSE,
        to.draw.arg=c("p","d.c","p.c","q.c", "p.d","q.d"))

## ----simulate, eval = TRUE-----------------------------------------------
X <- Simulation()
seed(X) <- setRNG()
simulate(X)
Data(X)[1:10]

## ----expectation, eval = TRUE--------------------------------------------
D4 <- LMCondDistribution(theta = 1)
D4  # corresponds to Norm(cond, 1)
N <- Norm(mean = 2)

E(D4, cond = 1)
E(D4, cond = 1, useApply = FALSE)
E(as(D4, "UnivariateCondDistribution"), cond = 1)
E(D4, function(x){x^2}, cond = 2)
E(D4, function(x){x^2}, cond = 2, useApply = FALSE)
E(N, function(x){x^2})
E(as(N, "UnivariateDistribution"), function(x){x^2}, 
     useApply = FALSE) # crude Monte-Carlo
E(D4, function(x, cond){cond*x^2}, cond = 2,
  withCond = TRUE)
E(D4, function(x, cond){cond*x^2}, cond = 2,
  withCond = TRUE, useApply = FALSE)
E(N, function(x){2*x^2})
E(as(N, "UnivariateDistribution"), function(x){2*x^2},
  useApply = FALSE) # crude Monte-Carlo
Y <- 5 * Binom(4, .25) - 3
Y
E(Y)  

## ----expectationlow, eval = TRUE-----------------------------------------
E(Cauchy(), low=3, upp=5)
var(Cauchy(), low=3, upp=5)

## ----expectation2, eval = TRUE-------------------------------------------
E(N, function(x)x^2) 
E(N, function(x)x^2,  lowerTruncQuantile = 1e-5)
var(Cauchy(), low =3, upperTruncQuantile = 1e-5,  IQR.fac = 10)
var(Cauchy(), low =3, upperTruncQuantile = 1e-10, IQR.fac = 20)

## ----var, eval = FALSE---------------------------------------------------
#    var <- function(x , ...)
#         {dots <- list(...)
#          if(hasArg(y)) y <- dots$"y"
#          na.rm <- ifelse(hasArg(na.rm), dots$"na.rm", FALSE)
#          if(!hasArg(use))
#               use <- ifelse (na.rm, "complete.obs","all.obs")
#          else use <- dots$"use"
#          if(hasArg(y))
#             stats::var(x = x, y = y, na.rm = na.rm, use)
#          else
#             stats::var(x = x, y = NULL, na.rm = na.rm, use)
#          }

## ----MCEstimator, eval = TRUE--------------------------------------------
    library(distrMod)
    x <- rgamma(50, scale = 0.5, shape = 3)
    G <- GammaFamily(scale = 1, shape = 2)
    negLoglikelihood <- function(x, Distribution){
        res <- -sum(log(Distribution@d(x)))
        names(res) <- "Negative Log-Likelihood"
        return(res)
    }
    MCEstimator(x = x, ParamFamily = G, criterion = negLoglikelihood)

## ----censPoisFamilyDef, eval = FALSE-------------------------------------
#      ## search interval for reasonable parameters
#      startPar <- function(x,...) c(.Machine$double.eps,max(x))
#  
#      ## what to do in case of leaving the parameter domain
#      makeOKPar <- function(param) {if(param<=0) return(.Machine$double.eps)
#                                    return(param)}

## ----PoisFamilyDef, eval = FALSE-----------------------------------------
#  setClass("PoisFamily", contains = "L2ParamFamily")

## ----NormLocationFamily, eval = FALSE------------------------------------
#  setClass("NormLocationFamily", contains = "L2LocationFamily")

## ----L2ScaleFamily, eval = FALSE-----------------------------------------
#   setMethod("validParameter", signature(object = "L2ScaleFamily"),
#            function(object, param, tol=.Machine$double.eps){
#               if(is(param,"ParamFamParameter"))
#                  param <- main(param)
#               if(!all(is.finite(param))) return(FALSE)
#               if(length(param)!=1) return(FALSE)
#               return(param > tol)})

## ----GammaFamilyModify, eval = FALSE-------------------------------------
#  setMethod("modifyModel", signature(model = "GammaFamily",
#             param = "ParamFamParameter"),
#            function(model, param, ...){
#               M <- modifyModel(as(model, "L2ParamFamily"), param = param,
#                                .withCall = FALSE)
#               M@L2derivSymm <- FunSymmList(OddSymmetric(SymmCenter =
#                                                         prod(main(param))),
#                                            NonSymmetric())
#               class(M) <- class(model)
#               return(M)
#            })

## ----MLEstimator, eval = TRUE--------------------------------------------
    MLEstimator(x = x, ParamFamily = G)
    MDEstimator(x = x, ParamFamily = G, distance = KolmogorovDist)

## ----NormScaleFam, eval = FALSE------------------------------------------
#  setMethod("mleCalc", signature(x = "numeric", PFam = "NormScaleFamily"),
#             function(x, PFam, ...){
#             n <- length(x)
#             theta <- sqrt((n-1)/n)*sd(x); mn <- mean(distribution(PFam))
#             ll <- -sum(dnorm(x, mean=mn, sd = theta, log=TRUE))
#             names(ll) <- "neg.Loglikelihood"
#             crit.fct <- function(sd)
#                           -sum(dnorm(x, mean=mn, sd = sd, log=TRUE))
#             param <- ParamFamParameter(name = "scale parameter",
#                                 main = c("sd"=theta))
#             if(!hasArg(Infos)) Infos <- NULL
#             return(meRes(x, theta, ll, param, crit.fct, Infos = Infos))
#  })

## ----CIex, eval = TRUE---------------------------------------------------
require(distrMod)
## some transformation
mtrafo <- function(x){
     nms0 <- c("scale","shape")
     nms <- c("shape","rate")
     fval0 <- c(x[2], 1/x[1])
     names(fval0) <- nms
     mat0 <- matrix( c(0, -1/x[1]^2, 1, 0), nrow = 2, ncol = 2,
                     dimnames = list(nms,nms0))                          
     list(fval = fval0, mat = mat0)}

set.seed(124)
x <- rgamma(50, scale = 0.5, shape = 3)

## parametric family of probability measures
G <- GammaFamily(scale = 1, shape = 2, trafo = mtrafo)
## MLE
res <- MLEstimator(x = x, ParamFamily = G)
print(res, digits = 4, show.details="maximal")
print(res, digits = 4, show.details="medium")
print(res, digits = 4, show.details="minimal")
ci <- confint(res)
print(ci, digits = 4, show.details="maximal")
print(ci, digits = 4, show.details="medium")
print(ci, digits = 4, show.details="minimal")

## some profiling
par(mfrow=c(2,1))
plot(profile(res))

## ----NormApprox, eval = TRUE---------------------------------------------
require(distr)

N <- Norm(0,1)
U <- Unif(0,1)
U2 <- U + U 
U4 <- U2 + U2
U8 <- U4 + U4
U12 <- U4 + U8
NormApprox <- U12 - 6

x <- seq(-4,4,0.001)

opar <- par(no.readonly = TRUE)
par(mfrow = c(2,1))

plot(x, d(NormApprox)(x),
     type = "l",
     xlab = "",
     ylab = "Density",
     main = "Exact and approximated density")
lines(x, d(N)(x),
      col = "red")
legend("topleft",
       legend = c("NormApprox", "Norm(0,1)"),
       fill = c("black", "red"))

plot(x, d(NormApprox)(x) - d(N)(x),
     type = "l",
     xlab = "",
     ylab = "\"black\" - \"red\"",
     col = "darkgreen",
     main = "Error")
lines(c(-4,4), c(0,0))

par(opar)

## ----ConvolutionNormalDistr, eval = TRUE---------------------------------
require(distr)

## initialize two normal distributions
A <- Norm(mean=1, sd=2)
B <- Norm(mean=4, sd=3) 

## convolution via addition of moments
AB <- A+B

## casting of A,B as absolutely continuous distributions
## that is, ``forget'' that A,B are normal distributions
A1 <- as(A, "AbscontDistribution")
B1 <- as(B, "AbscontDistribution")

## for higher precision we change the global variable
## "TruncQuantile" from 1e-5 to 1e-8
oldeps <- getdistrOption("TruncQuantile")
eps <- 1e-8
distroptions("TruncQuantile" = eps)
## support of A1+B1 for FFT convolution is
## [q(A1)(TruncQuantile), 
##  q(B1)(TruncQuantile, lower.tail = FALSE)]

## convolution via FFT
AB1 <- A1+B1

#############################
## plots of the results
#############################
par(mfrow=c(1,3))
low <- q(AB)(1e-15)
upp <- q(AB)(1e-15, lower.tail = FALSE)
x <- seq(from = low, to = upp, length = 10000)

## densities
plot(x, d(AB)(x), type = "l", lwd = 5)
lines(x , d(AB1)(x), col = "orange", lwd = 1)
title("Densities")
legend("topleft", legend=c("exact", "FFT"), 
        fill=c("black", "orange"))

## cdfs
plot(x, p(AB)(x), type = "l", lwd = 5)
lines(x , p(AB1)(x), col = "orange", lwd = 1)
title("CDFs")
legend("topleft", legend=c("exact", "FFT"), 
        fill=c("black", "orange"))

## quantile functions
x <- seq(from = eps, to = 1-eps, length = 1000)
plot(x, q(AB)(x), type = "l", lwd = 5)
lines(x , q(AB1)(x), col = "orange", lwd = 1) 
title("Quantile functions")
legend("topleft", legend=c("exact", "FFT"), 
        fill=c("black", "orange"))

## Since the plots of the results show no 
## recognizable differencies, we also compute 
## the total variation distance of the densities 
## and the Kolmogorov distance of the cdfs

## total variation distance of densities
total.var <- function(z, N1, N2){
    0.5*abs(d(N1)(z) - d(N2)(z))
}
dv <- integrate(total.var, lower=-Inf, upper=Inf, rel.tol=1e-8, N1=AB, N2=AB1)
cat("Total variation distance of densities:\t")
print(dv) # 4.25e-07

### meanwhile realized in package "distrEx" 
### as TotalVarDist(N1,N2)

## Kolmogorov distance of cdfs 
## the distance is evaluated on a random grid
z <- r(Unif(Min=low, Max=upp))(1e5)
dk <- max(abs(p(AB)(z)-p(AB1)(z)))
cat("Kolmogorov distance of cdfs:\t", dk, "\n") 
# 2.03e-07

### meanwhile realized in package "distrEx" 
### as KolmogorovDist(N1,N2)

## old distroptions
distroptions("TruncQuantile" = oldeps)


## ----ComparisonFFTandRtoDPQ.R, eval = TRUE-------------------------------
require(distr)

################################
## Comparison 1 - FFT and RtoDPQ 
################################

N1 <- Norm(0,3)
N2 <- Norm(0,4)
rnew1 <- function(n) r(N1)(n) + r(N2)(n) 

X <- N1 + N2 
     # exact formula -> N(0,5)
Y <- N1 + as(N2, "AbscontDistribution") 
     # appoximated with FFT
Z <- new("AbscontDistribution", r = rnew1) 
     # appoximated with RtoDPQ

# density-plot

x <- seq(-15,15,0.01)
plot(x, d(X)(x),
     type = "l",
     lwd = 3,
     xlab = "",
     ylab = "density",
     main = "Comparison 1",     
     col = "black")
lines(x, d(Y)(x),
     col = "yellow")
lines(x, d(Z)(x),
     col = "red")
legend("topleft",
  legend = c("Exact", "FFT-Approximation", 
             "RtoDPQ-Approximation"),
       fill = c("black", "yellow", "red"))
      
############################################
## Comparison 2 - "Exact" Formula and RtoDPQ
############################################

B <- Binom(size = 6, prob = 0.5) * 10
N <- Norm()
rnew2 <- function(n) r(B)(n) + r(N)(n)

Y <- B + N 
     # "exact" formula
Z <- new("AbscontDistribution", r = rnew2) 
     # appoximated with RtoDPQ

# density-plot

x  <- seq(-5,65,0.01)
plot(x, d(Y)(x),
     type = "l",
     xlab = "",
     ylab = "density",
     main = "Comparison 2",
     col = "black")
lines(x, d(Z)(x),
     col = "red")
legend("topleft",
       legend = c("Exact", "RtoDQP-Approximation"),
       fill = c("black", "red"))

## ----StationaryRegressorDistr, eval = TRUE-------------------------------
require(distr)

## Approximation of the stationary regressor 
## distribution of an AR(1) process 
##       X_t = phi X_{t-1} + V_t 
## where V_t i.i.d N(0,1) and phi\in(0,1)
## We obtain 
##    X_t = \sum_{j=1}^\infty phi^j V_{t-j}
## i.e., X_t \sim N(0,1/(1-phi^2))
phi <- 0.5

## casting of V as absolutely continuous distributions
## that is, ``forget'' that V is a normal distribution
V <- as(Norm(), "AbscontDistribution")

## for higher precision we change the global variable
## "TruncQuantile" from 1e-5 to 1e-8
oldeps <- getdistrOption("TruncQuantile")
eps <- 1e-8
distroptions("TruncQuantile" = eps)

## Computation of the approximation 
##      H=\sum_{j=1}^n phi^j V_{t-j}
## of the stationary regressor distribution 
## (via convolution using FFT)
H <- V
n <- 15 
## may take some time
### switch off warnings [would be issued due to 
###  very unequal variances...]
old.warn <- getOption("warn")
options("warn" = -1)
for(i in 1:n){Vi <- phi^i*V; H <- H + Vi } 
options("warn" = old.warn)

## the stationary regressor distribution (exact)
X <- Norm(sd=sqrt(1/(1-phi^2)))

#############################
## plots of the results
#############################
par(mfrow=c(1,3))
low <- q(X)(1e-15)
upp <- q(X)(1e-15, lower.tail = FALSE)
x <- seq(from = low, to = upp, length = 10000)

## densities
plot(x, d(X)(x),type = "l", lwd = 5)
lines(x , d(H)(x), col = "orange", lwd = 1)
title("Densities")
legend("topleft", legend=c("exact", "FFT"), 
        fill=c("black", "orange"))

## cdfs
plot(x, p(X)(x),type = "l", lwd = 5)
lines(x , p(H)(x), col = "orange", lwd = 1)
title("CDFs")
legend("topleft", legend=c("exact", "FFT"), 
        fill=c("black", "orange"))

## quantile functions
x <- seq(from = eps, to = 1-eps, length = 1000)
plot(x, q(X)(x),type = "l", lwd = 5)
lines(x , q(H)(x), col = "orange", lwd = 1)
title("Quantile functions")
legend( "topleft", 
        legend=c("exact", "FFT"), 
        fill=c("black", "orange"))

## Since the plots of the results show no 
## recognizable differencies, we also compute 
## the total variation distance of the densities 
## and the Kolmogorov distance of the cdfs

## total variation distance of densities
total.var <- function(z, N1, N2){
    0.5*abs(d(N1)(z) - d(N2)(z))
}
dv <- integrate(f = total.var, lower = -Inf, 
                upper = Inf, rel.tol = 1e-7, 
                N1=X, N2=H)
cat("Total variation distance of densities:\t")
print(dv) # ~ 5.0e-06

### meanwhile realized in package "distrEx" 
### as TotalVarDist(N1,N2)


## Kolmogorov distance of cdfs 
## the distance is evaluated on a random grid
z <- r(Unif(Min=low, Max=upp))(1e5)
dk <- max(abs(p(X)(z)-p(H)(z)))
cat("Kolmogorov distance of cdfs:\t", dk, "\n") 
# ~2.5e-06

### meanwhile realized in package "distrEx" 
### as KolmogorovDist(N1,N2)


## old distroptions
distroptions("TruncQuantile" = oldeps)


## ----destructive, eval = TRUE--------------------------------------------
##########################################################
## Demo: Instructive destructive example
##########################################################
require(distr)

## package "distr" encourages 
## consistency but does not 
## enforce it---so in general  
## d o   n o t   m o d i f y
## slots d,p,q,r!

N <- Norm()
B <- Binom()
N@d <- B@d
plot(N, lwd = 3) 

## ----SimulateandEstimate, eval = TRUE, fig.width=8.8, fig.height=3.8-----
require(distrTEst)
    ### also loads distrSim
sim <- new("Simulation",
           seed = setRNG(),
           distribution = Norm(mean = 0, sd = 1),
           filename="sim_01",
           runs = 1000,
           samplesize = 30)

contsim <- new("Contsimulation",
               seed = setRNG(),
               distribution.id = Norm(mean = 0, sd = 1),
               distribution.c = Norm(mean = 0, sd = 9),
               rate = 0.1,
               filename="contsim_01",
               runs = 1000,
               samplesize = 30)

simulate(sim)
simulate(contsim)

sim
summary(contsim)
plot(contsim)

## ----elist, eval = TRUE--------------------------------------------------
require(distrTEst)
psim <- function(theta,y,m0){
  mean(pmin(pmax(-m0, y - theta), m0))
  }
mestimator <- function(x, m = 0.7) {
  uniroot(f = psim,
          lower = -20,
          upper = 20,
          tol = 1e-10,
          y = x,
          m0 = m,
          maxiter = 20)$root
  }

result.id.mean <- evaluate(sim, mean)
result.id.mest <- evaluate(sim, mestimator)
result.id.median <- evaluate(sim, median)


result.cont.mean <- evaluate(contsim, mean)
result.cont.mest <- evaluate(contsim, mestimator)
result.cont.median <- evaluate(contsim, median)

elist <- EvaluationList(result.cont.mean,
                        result.cont.mest,
                        result.cont.median) 

elist
summary(elist)
plot(elist, cex = 0.7, las = 2)

## ----mest, eval = TRUE---------------------------------------------------
result.cont.mest

## ----elist.summary, eval = TRUE------------------------------------------
summary(elist)

## ----Expectation, eval = TRUE--------------------------------------------
require("distrEx")
# Example
id <- function(x) x
sq <- function(x) x^2

# Expectation and Variance of Binom(6,0.5)
B <- Binom(6, 0.5)
E(B, id)
E(B, sq) - E(B, id)^2

# Expectation and Variance of Norm(1,1)
N <- Norm(1, 1)
E(N, id)
E(N, sq) - E(N, id)^2

## ----nFoldConvolution, eval = TRUE---------------------------------------
##########################################################
## Demo: n-fold convolution of absolutely continuous 
##       probability distributions
##########################################################
require(distr)

if(!isGeneric("convpow")) 
    setGeneric("convpow", 
    function(D1,...) standardGeneric("convpow"))

##########################################################
## Function for n-fold convolution
## -- absolute continuous distribution -- 
##########################################################

##implentation of Algorithm 3.4. of 
# Kohl, M., Ruckdeschel, P., Stabla, T. (2005): 
#   General purpose convolution algorithm for distributions 
#   in S4-Classes by means of FFT.
# Technical report, Feb. 2005. Also available in
# http://www.uni-bayreuth.de/departments/math/org/mathe7/
#       /RUCKDESCHEL/pubs/comp.pdf


setMethod("convpow",
          signature(D1 = "AbscontDistribution"),
          function(D1, N){
            if((N < 1)||(!identical(floor(N), N)))
              stop("N has to be a natural greater than 0")
            
            m <- getdistrOption("DefaultNrFFTGridPointsExponent")

    ##STEP 1

            lower <- ifelse((q(D1)(0) > - Inf), q(D1)(0), 
                     q(D1)(getdistrOption("TruncQuantile"))) 
            upper <- ifelse((q(D1)(1) < Inf), q(D1)(1), 
                     q(D1)(getdistrOption("TruncQuantile"), lower.tail = FALSE))

    ##STEP 2

            M <- 2^m
            h <- (upper-lower)/M
            if(h > 0.01)
              warning(paste("Grid for approxfun too wide, ", 
              "increase DefaultNrFFTGridPointsExponent", sep=""))
            x <- seq(from = lower, to = upper, by = h)
            p1 <- p(D1)(x)

    ##STEP 3

            p1 <- p1[2:(M + 1)] - p1[1:M]

    ##STEP 4
    
            ## computation of DFT
            pn <- c(p1, numeric((N-1)*M))
            fftpn <- fft(pn)

    ##STEP 5

            ## convolution theorem for DFTs
            pn <- Re(fft(fftpn^N, inverse = TRUE)) / (N*M)
            pn <- (abs(pn) >= .Machine$double.eps)*pn
            i.max <- N*M-(N-2)
            pn <- c(0,pn[1:i.max])
            dn <- pn / h
            pn <- cumsum(pn)

    ##STEP 6(density)

            ## density 
            x <- c(N*lower,seq(from = N*lower+N/2*h, 
                   to = N*upper-N/2*h, by=h),N*upper)
            dnfun1 <- approxfun(x = x, y = dn, yleft = 0, yright = 0)

    ##STEP 7(density)
 
            standardizer <- sum(dn[2:i.max]) + (dn[1]+dn[i.max+1]) / 2
            dnfun2 <- function(x) dnfun1(x) / standardizer

    ##STEP 6(cdf)
    
            ## cdf with continuity correction h/2
            pnfun1 <- approxfun(x = x+0.5*h, y = pn, 
                        yleft = 0, yright = pn[i.max+1])

    ##STEP 7(cdf)
   
            pnfun2 <- function(x) pnfun1(x) / pn[i.max+1]


            ## quantile with continuity correction h/2
            yleft <- ifelse(((q(D1)(0) == -Inf)|
                             (q(D1)(0) == -Inf)), 
                             -Inf, N*lower)
            yright <- ifelse(((q(D1)(1) == Inf)|
                              (q(D1)(1) == Inf)), 
                              Inf, N*upper)    
            w0 <- options("warn")
            options(warn = -1)
            qnfun1 <- approxfun(x = pnfun2(x+0.5*h), 
                        y = x+0.5*h, yleft = yleft, yright = yright)
            qnfun2 <- function(x){ 
            ind1 <- (x == 0)*(1:length(x))
            ind2 <- (x == 1)*(1:length(x))
            y <- qnfun1(x)
            y <- replace(y, ind1[ind1 != 0], yleft)
            y <- replace(y, ind2[ind2 != 0], yright)
            return(y)
            }
            options(w0)

            rnew = function(N) apply(matrix(r(e1)(n*N), 
                                     ncol=N), 1, sum)

            return(new("AbscontDistribution", r = rnew, 
                       d = dnfun1, p = pnfun2, q = qnfun2))
})


## initialize a normal distribution
A <- Norm(mean=0, sd=1)

## convolution power
N <- 10 

## convolution via FFT
AN <- convpow(as(A,"AbscontDistribution"), N)
##  ... for the normal distribution , 'convpow' has an "exact"
##      method by version 1.9 so the as(.,.)  is needed to
##      see how the algorithm above works

## convolution exact
AN1 <- Norm(mean=0, sd=sqrt(N))

## plots of the results
eps <- getdistrOption("TruncQuantile")
par(mfrow=c(1,3))
low <- q(AN1)(eps)
upp <- q(AN1)(eps, lower.tail = FALSE)
x <- seq(from = low, to = upp, length = 10000)

## densities
plot(x, d(AN1)(x), type = "l", lwd = 5)
lines(x , d(AN)(x), col = "orange", lwd = 1)
title("Densities")
legend("topleft", legend=c("exact", "FFT"), 
        fill=c("black", "orange"))

## cdfs
plot(x, p(AN1)(x), type = "l", lwd = 5)
lines(x , p(AN)(x), col = "orange", lwd = 1)
title("CDFs")
legend("topleft", legend=c("exact", "FFT"), 
        fill=c("black", "orange"))

## quantile functions
x <- seq(from = eps, to = 1-eps, length = 1000)
plot(x, q(AN1)(x), type = "l", lwd = 5)
lines(x , q(AN)(x), col = "orange", lwd = 1) 
title("Quantile functions")
legend("topleft", 
       legend = c("exact", "FFT"), 
        fill = c("black", "orange"))

