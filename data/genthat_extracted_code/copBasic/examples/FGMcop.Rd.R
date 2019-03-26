library(copBasic)


### Name: FGMcop
### Title: The Generalized Farlie-Gumbel-Morgenstern Copula
### Aliases: FGMcop
### Keywords: Farlie--Gumbel--Morgenstern copula copula (formulas) copula

### ** Examples

## Not run: 
##D # Bekrizade et al. (2012, table 1) report for a=2 and n=3 that range in 
##D # theta = [-0.1667, 0.1667] and range in rho = [-0.1806641, 0.4036458]. However,
##D # we see that they have made an error in listing the lower bounds of theta:
##D rhoCOP(FGMcop, para=c(  1/6, 2, 3))  #  0.4036458
##D rhoCOP(FGMcop, para=c( -1/6, 2, 3))  # Following error results
##D # In cop(u, v, para = para, ...) : parameter Theta < -0.0833333333333333
##D rhoCOP(FGMcop, para=c(-1/12, 2, 3))  # -0.1806641 
## End(Not run)

## Not run: 
##D # Maximum likelihood estimation near theta upper bounds for a=3 and n=2. 
##D set.seed(832)
##D UV <- simCOP(300, cop=FGMcop, para=c(+.16,3,2))
##D # Define a transform function for parameter domain, though mleCOP does
##D # provide some robustness anyway---not forcing n into the positive
##D # domain via as.integer(exp(p[3])) seems to not always be needed.
##D FGMpfunc <- function(p) {
##D   d <- p[1]; a <- exp(p[2]); n <- as.integer(exp(p[3]))
##D   lwr <- -min(c(1,1/(n*a^2))); upr <- 1/(n*a)
##D   d <- ifelse(d <= lwr, lwr, ifelse(d >= upr, upr, d))
##D   return(c(d,a,n))
##D }
##D para <- c(.16,3,2); init <- c(0,1,1)
##D ML <- mleCOP(UV$U, UV$V, cop=FGMcop, init.para=init, parafn=FGMpfunc)
##D print(ML$para) # [1] 0.1596361 3.1321228 2.0000000
##D # So, we have recovered reasonable estimates of the three parameters
##D # given through MLE estimation.
##D densityCOPplot(cop=FGMcop, para=   para, contour.col=2)
##D densityCOPplot(cop=FGMcop, para=ML$para, ploton=FALSE) # 
## End(Not run)



