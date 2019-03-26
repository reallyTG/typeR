library(sirt)


### Name: brm-Methods
### Title: Functions for the Beta Item Response Model
### Aliases: brm.sim brm.irf
### Keywords: Beta item response model

### ** Examples

#############################################################################
# EXAMPLE 1: Simulated data beta response model
#############################################################################

#*** (1) Simulation of the beta response model
# Table 3 (p. 65) of Noel and Dauvier (2007)
delta <- c( -.942, -.649, -.603, -.398, -.379, .523, .649, .781, .907 )
tau <- c( .382, .166, 1.799, .615, 2.092, 1.988, 1.899, 1.439, 1.057 )
K <- 5        # number of categories for discretization
N <- 500        # number of persons
I <- length(delta) # number of items

set.seed(865)
theta <- stats::rnorm( N )
dat <- sirt::brm.sim( theta=theta, delta=delta, tau=tau, K=K)
psych::describe(dat)

#*** (2) some preliminaries for estimation of the model in mirt
#*** define a mirt function
library(mirt)
Theta <- matrix( seq( -4, 4, len=21), ncol=1 )

# compute item response function
ii <- 1     # item ii=1
b1 <- sirt::brm.irf( Theta=Theta, delta=delta[ii], tau=tau[ii],  ncat=K )
# plot item response functions
graphics::matplot( Theta[,1], b1, type="l" )

#*** defining the beta item response function for estimation in mirt
par <- c( 0, 1,  1)
names(par) <- c( "delta", "tau","thdim")
est <- c( TRUE, TRUE, FALSE )
names(est) <- names(par)
brm.icc <- function( par, Theta, ncat ){
     delta <- par[1]
     tau <- par[2]
     thdim <- par[3]
     probs <- sirt::brm.irf( Theta=Theta, delta=delta, tau=tau,  ncat=ncat,
            thdim=thdim)
     return(probs)
            }
name <- "brm"
# create item response function
brm.itemfct <- mirt::createItem(name, par=par, est=est, P=brm.icc)
#*** define model in mirt
mirtmodel <- mirt::mirt.model("
           F1=1-9
            " )
itemtype <- rep("brm", I )
customItems <- list("brm"=brm.itemfct)

# define parameters to be estimated
mod1.pars <- mirt::mirt(dat, mirtmodel, itemtype=itemtype,
                   customItems=customItems, pars="values")

## Not run: 
##D #*** (3) estimate beta item response model in mirt
##D mod1 <- mirt::mirt(dat,mirtmodel, itemtype=itemtype, customItems=customItems,
##D                pars=mod1.pars, verbose=TRUE  )
##D # model summaries
##D print(mod1)
##D summary(mod1)
##D coef(mod1)
##D # estimated coefficients and comparison with simulated data
##D cbind( sirt::mirt.wrapper.coef( mod1 )$coef, delta, tau )
##D mirt.wrapper.itemplot(mod1,ask=TRUE)
##D 
##D #---------------------------
##D # estimate beta item response model in TAM
##D library(TAM)
##D 
##D # define the skill space: standard normal distribution
##D TP <- 21                   # number of theta points
##D theta.k <- diag(TP)
##D theta.vec <-  seq( -6,6, len=TP)
##D d1 <- stats::dnorm(theta.vec)
##D d1 <- d1 / sum(d1)
##D delta.designmatrix <- matrix( log(d1), ncol=1 )
##D delta.fixed <- cbind( 1, 1, 1 )
##D 
##D # define design matrix E
##D E <- array(0, dim=c(I,K,TP,2*I + 1) )
##D dimnames(E)[[1]] <- items <- colnames(dat)
##D dimnames(E)[[4]] <- c( paste0( rep( items, each=2 ),
##D         rep( c("_a","_b" ), I) ), "one" )
##D for (ii in 1:I){
##D     for (kk in 1:K){
##D       for (tt in 1:TP){
##D         qk <- (2*(kk-1)+1)/(2*K)
##D         gammap <- exp( theta.vec[tt] / 2 )
##D         E[ii, kk, tt, 2*(ii-1) + 1 ] <- gammap * log( qk )
##D         E[ii, kk, tt, 2*(ii-1) + 2 ] <- 1 / gammap * log( 1 - qk )
##D         E[ii, kk, tt, 2*I+1 ] <- - log(qk) - log( 1 - qk )
##D                     }
##D             }
##D         }
##D gammaslope.fixed <- cbind( 2*I+1, 1 )
##D gammaslope <- exp( rep(0,2*I+1) )
##D 
##D # estimate model in TAM
##D mod2 <- TAM::tam.mml.3pl(resp=dat, E=E,control=list(maxiter=100),
##D               skillspace="discrete", delta.designmatrix=delta.designmatrix,
##D               delta.fixed=delta.fixed, theta.k=theta.k, gammaslope=gammaslope,
##D               gammaslope.fixed=gammaslope.fixed, notA=TRUE )
##D summary(mod2)
##D 
##D # extract original tau and delta parameters
##D m1 <- matrix( mod2$gammaslope[1:(2*I) ], ncol=2, byrow=TRUE )
##D m1 <- as.data.frame(m1)
##D colnames(m1) <- c("a","b")
##D m1$delta.TAM <- log( m1$b / m1$a)
##D m1$tau.TAM <- log( m1$a * m1$b )
##D 
##D # compare estimated parameter
##D m2 <- cbind( sirt::mirt.wrapper.coef( mod1 )$coef, delta, tau )[,-1]
##D colnames(m2) <- c(  "delta.mirt", "tau.mirt", "thdim","delta.true","tau.true"   )
##D m2 <- cbind(m1,m2)
##D round( m2, 3 )
## End(Not run)



