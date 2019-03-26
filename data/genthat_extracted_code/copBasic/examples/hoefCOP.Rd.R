library(copBasic)


### Name: hoefCOP
### Title: The Hoeffding's Phi of a Copula or Lp Distances (Independence,
###   Radial Asymmetry, or Reflection Symmetry Forms)
### Aliases: hoefCOP LpCOP LpCOPradsym LpCOPpermsym
### Keywords: copula (characteristics) copula (properties) dependence index
###   Lp distance Nelsen (2006) Examples and Exercises

### ** Examples

## Not run: 
##D # Example (ii) Gaisser et al. (2010, p. 2574)
##D Theta <- 0.66 # Phi^2 = Theta^2 ---> Phi == Theta as shown
##D hoefCOP(cop=convex2COP, para=c(alpha=Theta, cop1=M, cop2=P)) # 0.6599886
##D 
##D rhoCOP(cop=PSP) == hoefCOP(cop=PSP, p=1) # TRUE
##D LpCOP(cop=PLACKETTcop, para=1.6, p=2.6)  # 0.1445137 (Fractional p)
## End(Not run)

## Not run: 
##D set.seed(938) # Phi(1.6; Plackett) = 0.1184489; L_1 = 0.1168737
##D UV <- simCOP(cop=PLACKETTcop, para=1.6, n=2000, ploton=FALSE, points=FALSE)
##D hoefCOP(cop=PLACKETTcop, para=1.6, p=200)  # Large p near internal limits
##D L_1 <- 4*max(abs(PLACKETTcop(UV$U, UV$V, para=1.6) - UV$U*UV$V)) # p is infty
##D # and finite n and arguably a sample-like statistic here, now on intuition try
##D # a more sample-like means
##D U <- runif(10000); V <- runif(10000)
##D L_2 <- 4*max(abs(EMPIRcop(U, V, para=UV) - U*V)) # 0.1410254 (not close enough)
## End(Not run)

## Not run: 
##D para <- list(alpha=0.15, beta=0.90, kappa=0.06, gamma=0.96,
##D              cop1=GHcop, cop2=PLACKETTcop, para1=5.5, para2=0.07)
##D LpCOPradsym( cop=composite2COP, para=para) # 0.02071164
##D LpCOPpermsym(cop=composite2COP, para=para) # 0.01540297
## End(Not run)

## Not run: 
##D "MOcop.formula" <- function(u,v, para=para, ...) {
##D    alpha <- para[1]; beta <- para[2]; return(min(v*u^(1-alpha), u*v^(1-beta)))
##D }
##D "MOcop" <- function(u,v, ...) { asCOP(u,v, f=MOcop.formula, ...) }
##D    LpCOPradsym( cop=MOcop, para=c(.8,.5)) # 0.0261843
##D    LpCOPpermsym(cop=MOcop, para=c(.8,.5)) # 0.0243912 
## End(Not run)



