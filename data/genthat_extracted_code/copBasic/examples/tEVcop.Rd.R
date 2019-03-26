library(copBasic)


### Name: tEVcop
### Title: The t-EV (Extreme Value) Copula
### Aliases: tEVcop
### Keywords: t-EV copula copula (formulas) copula package copula
###   (comparison to) copula (extreme value) extreme value copula Joe
###   (2014) Examples and Exercises

### ** Examples

## Not run: 
##D tau <- 1/3 # Example from copula::evCopula.Rd
##D tev.cop <- tevCopula(iTau(tevCopula(), tau))
##D copula::pCopula(c(0.1,.5), copula=tev.cop)         # 0.07811367
##D tEVcop(0.1, 0.5, para=slot(tev.cop, "parameters")) # 0.07811367
## End(Not run)

## Not run: 
##D nsim <- 2000; pargh <- c(5, 0.5, 0.5)
##D UV <- simCOP(nsim, cop=GHcop, para=pargh)
##D U <- lmomco::pp(UV[,1], sort=FALSE)
##D V <- lmomco::pp(UV[,2], sort=FALSE)
##D RT <- mleCOP(u=U, v=V, cop=tEVcop, init.para=c(0.5,log(4)),
##D              parafn=function(k) return(c(k[1], exp(k[2]))))
##D partev <- RT$para
##D 
##D FT <- simCOP(nsim, cop=tEVcop, para=RT$para)
##D 
##D tauCOP(cop=GHcop,  para=pargh )
##D tauCOP(cop=tEVcop, para=partev)
##D 
##D tauCOP(cop=GHcop,  para=pargh ) # [1] 0.3003678
##D tauCOP(cop=tEVcop, para=partev) # [1] 0.3178904
##D 
##D densityCOPplot(cop=GHcop,  para=pargh)
##D densityCOPplot(cop=tEVcop, para=partev,
##D                ploton=FALSE, contour.col=2) #
## End(Not run)

## Not run: 
##D # A demonstration Joe (2014, p. 190) for which tEvcop() has
##D # upper tail dependence parameter as
##D para <- c(0.8, 10)
##D lamU <- 2*pt(-sqrt((para[2]+1)*(1-para[1])/(1+para[1])), para[2]+1)
##D "tEVcop.copula" <- function(u,v, para=NULL, ...) {
##D       if(length(u)==1) u<-rep(u,length(v)); if(length(v)==1) v<-rep(v,length(u))
##D       return(copula::pCopula(matrix(c(u,v), ncol=2),
##D                    tevCopula(param=para[1], df=para[2])))
##D }
##D lamU.copBasic <- taildepCOP(cop=tEVcop,        para)$lambdaU
##D lamU.copula   <- taildepCOP(cop=tEVcop.copula, para)$lambdaU
##D print(c(lamU, lamU.copBasic, lamU.copula))
##D #[1] 0.2925185 0.2925200 0.2925200 # So we see that they all match. 
## End(Not run)

## Not run: 
##D # Convergence of tEVcop to HRcop as nu goes to infinity.
##D nu <- 10^(seq(-4,2,by=.1)) # nu right end point rho dependent
##D rho <- 0.7 # otherwise, expect to see 'zeros' errors on the plot()
##D # Compute Blomqvist Beta (fast computation is reason for choice)
##D btEV <- sapply(nu, function(n) blomCOP(tEVcop, para=c(rho, n)))
##D limit.thetas <- sqrt(2/(nu*(1-rho))) # for nu --> infinity HRcop
##D thetas <- sapply(btEV, function(b) {
##D      uniroot(function(l, blom=NA) { blom - blomCOP(HRcop, para=l) },
##D      interval=c(0,10), blom=b)$root })
##D plot(limit.thetas, thetas, log="xy", type="b",
##D      xlab="Theta of HRcop via limit nu --> infinity",
##D      ylab="Theta from Blomqvist Beta equivalent HRcop to tEVcop")
##D abline(0,1)
##D mtext(paste0("Note 'weak' convergence to lower left, and \n",
##D              "convergence increasing with rho"))
##D # Another reference of note
##D # https://mediatum.ub.tum.de/doc/1145695/1145695.pdf (p.39) #
## End(Not run)



