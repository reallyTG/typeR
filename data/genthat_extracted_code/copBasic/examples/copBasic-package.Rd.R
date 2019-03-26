library(copBasic)


### Name: copBasic-package
### Title: Basic Theoretical Copula, Empirical Copula, and Various Utility
###   Functions
### Aliases: copBasic-package
### Keywords: multivariate L-comoments Nelsen (2006) Examples and Exercises
###   return period (conditional) return period (secondary) Table of
###   Copulas

### ** Examples

## Not run: 
##D # Nelsen (2006, p. 75, exer. 3.15b) provides for a nice test of copBasic features.
##D "mcdurv" <- function(u,v, theta) {
##D    ifelse(u > theta & u < 1-theta & v > theta & v < 1 - theta,
##D              return(M(u,v) - theta), # Upper bounds copula with a shift
##D              return(W(u,v)))         # Lower bounds copula
##D }
##D "MCDURV" <- function(u,v, para=NULL) {
##D    if(is.null(para))         stop("need theta")
##D    if(para < 0 | para > 0.5) stop("theta ! in [0,1/2]")
##D    return(asCOP(u, v, f=mcdurv, para))
##D }
##D "afunc" <- function(t) { # a sample size = 1,000 hard wired
##D    return(cov(simCOP(n=1000, cop=MCDURV, para=t, ploton=FALSE, points=FALSE))[1,2])
##D }
##D set.seed(6234) # setup covariance based on parameter "t" and the "root" parameter
##D print(uniroot(afunc, c(0,0.5))) # "t" by simulation = 0.1023742
##D # Nelsen reports that if theta appox. 0.103 then covariance of U and V is zero.
##D # So one will have mutually completely dependent uncorrelated uniform variables!
##D 
##D # Let us check some familiar measures of association:
##D rhoCOP( cop=MCDURV, para=0.1023742) # Spearman Rho = 0.005854481 (near zero)
##D tauCOP( cop=MCDURV, para=0.1023742) # Kendall Tau  = 0.2648521
##D wolfCOP(cop=MCDURV, para=0.1023742) # S & W Sigma  = 0.4690174 (less familiar)
##D D <- simCOP(n=1000, cop=MCDURV, para=0.1023742) # Plot mimics Nelsen (2006, fig. 3.11)
##D # Lastly, open research problem. L-comoments (matrices) measure high dimension of
##D # variable comovements (see lmomco package)---"method of L-comoments" for estimation?
##D lmomco::lcomoms2(simCOP(n=1000, cop=MCDURV, para=0),   nmom=5) # Perfect neg. corr.
##D lmomco::lcomoms2(simCOP(n=1000, cop=MCDURV, para=0.1023742), nmom=5)
##D lmomco::lcomoms2(simCOP(n=1000, cop=MCDURV, para=0.5), nmom=5) # Perfect pos. corr.
##D # T2 (L-correlation), T3 (L-coskew), T4 (L-cokurtosis), and T5 matrices result. For
##D # Theta = 0 or 0.5 see the matrix symmetry with a sign change for L-coskew and T5 on
##D # the off diagonals (offdiags). See unities for T2. See near zero for offdiag terms
##D # in T2 near zero. But then see that T4 offdiags are quite different from those for
##D # Theta 0.1024 relative to 0 or 0.5. Thus, T4 has captured a unique property of U vs V.
## End(Not run)



