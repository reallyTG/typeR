library(sirt)


### Name: sim.qm.ramsay
### Title: Simulate from Ramsay's Quotient Model
### Aliases: sim.qm.ramsay
### Keywords: Simulating IRT models

### ** Examples

#############################################################################
# EXAMPLE 1: Estimate Ramsay Quotient Model with rasch.mml2
#############################################################################

set.seed(657)
# simulate data according to the Ramsay model
N <- 1000       # persons
I <- 11         # items
theta <- exp( stats::rnorm( N ) )  # person ability
b <- exp( seq(-2,2,len=I))  # item difficulty
K <- rep( 3, I )           # K parameter (=> guessing)

# apply simulation function
dat <- sirt::sim.qm.ramsay( theta, b, K )

#***
# analysis
mmliter <- 50       # maximum number of iterations
I <- ncol(dat)
fixed.K <- rep( 3, I )

# Ramsay QM with fixed K parameter (K=3 in fixed.K specification)
mod1 <- sirt::rasch.mml2( dat, mmliter=mmliter, irtmodel="ramsay.qm",
              fixed.K=fixed.K )
summary(mod1)

# Ramsay QM with joint estimated K parameters
mod2 <- sirt::rasch.mml2( dat, mmliter=mmliter, irtmodel="ramsay.qm",
             est.K=rep(1,I)  )
summary(mod2)

## Not run: 
##D # Ramsay QM with itemwise estimated K parameters
##D mod3 <- sirt::rasch.mml2( dat, mmliter=mmliter, irtmodel="ramsay.qm",
##D               est.K=1:I  )
##D summary(mod3)
##D 
##D # Rasch model
##D mod4 <- sirt::rasch.mml2( dat )
##D summary(mod4)
##D 
##D # generalized logistic model
##D mod5 <- sirt::rasch.mml2( dat, est.alpha=TRUE, mmliter=mmliter)
##D summary(mod5)
##D 
##D # 2PL model
##D mod6 <- sirt::rasch.mml2( dat, est.a=rep(1,I) )
##D summary(mod6)
##D 
##D # Difficulty + Guessing (b+c) Model
##D mod7 <- sirt::rasch.mml2( dat, est.c=rep(1,I) )
##D summary(mod7)
##D 
##D # estimate separate guessing (c) parameters
##D mod8 <- sirt::rasch.mml2( dat, est.c=1:I  )
##D summary(mod8)
##D 
##D #*** estimate Model 1 with user defined function in mirt package
##D 
##D # create user defined function for Ramsay's quotient model
##D name <- 'ramsayqm'
##D par <- c("K"=3, "b"=1 )
##D est <- c(TRUE, TRUE)
##D P.ramsay <- function(par,Theta){
##D      eps <- .01
##D      K <- par[1]
##D      b <- par[2]
##D      num <- exp( exp( Theta[,1] ) / b )
##D      denom <- K + num
##D      P1 <- num / denom
##D      P1 <- eps + ( 1 - 2*eps ) * P1
##D      cbind(1-P1, P1)
##D }
##D 
##D # create item response function
##D ramsayqm <- mirt::createItem(name, par=par, est=est, P=P.ramsay)
##D # define parameters to be estimated
##D mod1m.pars <- mirt::mirt(dat, 1, rep( "ramsayqm",I),
##D                    customItems=list("ramsayqm"=ramsayqm), pars="values")
##D mod1m.pars[ mod1m.pars$name=="K", "est" ] <- FALSE
##D # define Theta design matrix
##D Theta <- matrix( seq(-3,3,len=10), ncol=1)
##D # estimate model
##D mod1m <- mirt::mirt(dat, 1, rep( "ramsayqm",I), customItems=list("ramsayqm"=ramsayqm),
##D                pars=mod1m.pars, verbose=TRUE,
##D                technical=list( customTheta=Theta, NCYCLES=50)
##D                 )
##D print(mod1m)
##D summary(mod1m)
##D cmod1m <- sirt::mirt.wrapper.coef( mod1m )$coef
##D # compare simulated and estimated values
##D dfr <- cbind( b, cmod1m$b, exp(mod1$item$b ) )
##D colnames(dfr) <- c("simulated", "mirt", "sirt_rasch.mml2")
##D round( dfr, 2 )
##D   ##      simulated mirt sirt_rasch.mml2
##D   ## [1,]      0.14 0.11            0.11
##D   ## [2,]      0.20 0.17            0.18
##D   ## [3,]      0.30 0.27            0.29
##D   ## [4,]      0.45 0.42            0.43
##D   ## [5,]      0.67 0.65            0.67
##D   ## [6,]      1.00 1.00            1.01
##D   ## [7,]      1.49 1.53            1.54
##D   ## [8,]      2.23 2.21            2.21
##D   ## [9,]      3.32 3.00            2.98
##D   ##[10,]      4.95 5.22            5.09
##D   ##[11,]      7.39 5.62            5.51
## End(Not run)



