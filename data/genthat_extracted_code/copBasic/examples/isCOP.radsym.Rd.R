library(copBasic)


### Name: isCOP.radsym
### Title: Is a Copula Radially Symmetric
### Aliases: isCOP.radsym
### Keywords: copula (characteristics) copula (properties) copula
###   (symmetry)

### ** Examples

# Radially symmetry is computationally intensive and relies on a gridded [0,1]x[0,1]
# space and laborious check on equality. Thus these examples are commented out for
# R's --timings check. Note that the proof of radial symmetry absent of algebraic
# manipulation or verification is difficult and subject to the fineness of the grid
# to find a nonequality from which to immediately conclude FALSE.
## Not run: 
##D isCOP.radsym(cop=P) # TRUE
##D 
##D para <- list(cop1=PLACKETTcop, cop2=M, para1=c(.3), para2=NA, alpha=0.8, beta=0.5)
##D isCOP.radsym(composite2COP, para=para) # FALSE
## End(Not run)
## Not run: 
##D gh <- simCOP(n=34, cop=GHcop, para=theta, ploton=FALSE, points=FALSE) * 150
##D # Pretend gh is real data, the * 150 is to clearly get into an arbitrary unit system.
##D 
##D # The sort=FALSE is critical in the following two calls
##D fakeU <- lmomco::pp(gh[,1], sort=FALSE) # Weibull plotting position i/(n+1)
##D fakeV <- lmomco::pp(gh[,2], sort=FALSE) # Weibull plotting position i/(n+1)
##D uv <- data.frame(U=fakeU, V=fakeV); # our U-statistics
##D 
##D set.seed(120); theta <- 2
##D gh <- simCOP(n=34, cop=GHcop, para=theta, ploton=FALSE, points=FALSE) * 150
##D # Pretend psp is real data, the * 150 is to clearly get into an arbitrary unit system.
##D 
##D # The sort=FALSE is critical in the following two calls
##D fakeU <- lmomco::pp(gh[,1], sort=FALSE) # Weibull plotting position i/(n+1)
##D fakeV <- lmomco::pp(gh[,2], sort=FALSE) # Weibull plotting position i/(n+1)
##D uv <- data.frame(U=fakeU, V=fakeV); # our U-statistics
##D 
##D isCOP.radsym(cop=EMPIRcop, para=uv) # FALSE
##D isCOP.LTD(cop=EMPIRcop,    para=uv) # TRUE
##D isCOP.RTI(cop=EMPIRcop,    para=uv) # FALSE
##D isCOP.PQD(cop=EMPIRcop,    para=uv,
##D                     empirical=TRUE) # TRUE
##D 
##D isCOP.radsym(cop=GHcop, para=theta) # FALSE
##D isCOP.LTD(cop=GHcop,    para=theta) # TRUE
##D isCOP.RTI(cop=GHcop,    para=theta) # TRUE
##D isCOP.PQD(cop=GHcop,    para=theta) # TRUE
##D 
##D # Notice that isCOP.RTI is not the same for empirical and theoretical.
##D # This shows the difficulty in tail dependence parameter estimation for
##D # small samples (see Salvadori et al., 2007 p. 175).
## End(Not run)



