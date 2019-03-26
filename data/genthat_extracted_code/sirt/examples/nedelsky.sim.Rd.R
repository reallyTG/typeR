library(sirt)


### Name: nedelsky-methods
### Title: Functions for the Nedelsky Model
### Aliases: nedelsky.sim nedelsky.latresp nedelsky.irf
### Keywords: Nedelsky model

### ** Examples

## Not run: 
##D #############################################################################
##D # EXAMPLE 1: Simulated data according to the Nedelsky model
##D #############################################################################
##D 
##D #*** simulate data
##D set.seed(123)
##D I <- 20          # number of items
##D b <- matrix(NA,I,ncol=3)
##D b[,1] <- -0.5 + stats::runif( I, -.75, .75 )
##D b[,2] <- -1.5 + stats::runif( I, -.75, .75 )
##D b[,3] <- -2.5 + stats::runif( I, -.75, .75 )
##D K <- 3           # number of distractors
##D N <- 2000        # number of persons
##D # apply simulation function
##D dat <- sirt::nedelsky.sim( theta=stats::rnorm(N,sd=1.2), b=b )
##D 
##D #*** latent response patterns
##D K <- 3
##D combis <- sirt::nedelsky.latresp(K=3)
##D 
##D #*** defining the Nedelsky item response function for estimation in mirt
##D par <- c( 3, rep(-1,K), 1, rep(1,K+1),1)
##D names(par) <- c("K", paste0("b",1:K), "a", paste0("tau", 0:K),"thdim")
##D est <- c( FALSE, rep(TRUE,K), rep(FALSE, K+1 + 2 ) )
##D names(est) <- names(par)
##D nedelsky.icc <- function( par, Theta, ncat ){
##D      K <- par[1]
##D      b <- par[ 1:K + 1]
##D      a <- par[ K+2]
##D      tau <- par[1:(K+1) + (K+2) ]
##D      thdim <- par[ K+2+K+1 +1 ]
##D      probs <- sirt::nedelsky.irf( Theta, K=K, b=b, a=a, tau=tau, combis,
##D                     thdim=thdim  )$probs
##D      return(probs)
##D }
##D name <- "nedelsky"
##D # create item response function
##D nedelsky.itemfct <- mirt::createItem(name, par=par, est=est, P=nedelsky.icc)
##D 
##D #*** define model in mirt
##D mirtmodel <- mirt::mirt.model("
##D            F1=1-20
##D            COV=F1*F1
##D            # define some prior distributions
##D            PRIOR=(1-20,b1,norm,-1,2),(1-20,b2,norm,-1,2),
##D                    (1-20,b3,norm,-1,2)
##D         " )
##D 
##D itemtype <- rep("nedelsky", I )
##D customItems <- list("nedelsky"=nedelsky.itemfct)
##D # define parameters to be estimated
##D mod1.pars <- mirt::mirt(dat, mirtmodel, itemtype=itemtype,
##D                    customItems=customItems, pars="values")
##D # estimate model
##D mod1 <- mirt::mirt(dat,mirtmodel, itemtype=itemtype, customItems=customItems,
##D                pars=mod1.pars, verbose=TRUE  )
##D # model summaries
##D print(mod1)
##D summary(mod1)
##D mirt.wrapper.coef( mod1 )$coef
##D mirt.wrapper.itemplot(mod1,ask=TRUE)
##D 
##D #******************************************************
##D # fit Nedelsky model with xxirt function in sirt
##D 
##D # define item class for xxirt
##D item_nedelsky <- sirt::xxirt_createDiscItem( name="nedelsky", par=par,
##D                 est=est, P=nedelsky.icc,
##D                 prior=c( b1="dnorm", b2="dnorm", b3="dnorm" ),
##D                 prior_par1=c( b1=-1, b2=-1, b3=-1),
##D                 prior_par2=c(b1=2, b2=2, b3=2) )
##D customItems <- list( item_nedelsky )
##D 
##D #---- definition theta distribution
##D #** theta grid
##D Theta <- matrix( seq(-6,6,length=21), ncol=1 )
##D #** theta distribution
##D P_Theta1 <- function( par, Theta, G){
##D     mu <- par[1]
##D     sigma <- max( par[2], .01 )
##D     TP <- nrow(Theta)
##D     pi_Theta <- matrix( 0, nrow=TP, ncol=G)
##D     pi1 <- dnorm( Theta[,1], mean=mu, sd=sigma )
##D     pi1 <- pi1 / sum(pi1)
##D     pi_Theta[,1] <- pi1
##D     return(pi_Theta)
##D }
##D #** create distribution class
##D par_Theta <- c( "mu"=0, "sigma"=1 )
##D customTheta <- sirt::xxirt_createThetaDistribution( par=par_Theta, est=c(FALSE,TRUE),
##D                    P=P_Theta1 )
##D 
##D #-- create parameter table
##D itemtype <- rep( "nedelsky", I )
##D partable <- sirt::xxirt_createParTable( dat, itemtype=itemtype, customItems=customItems)
##D 
##D # estimate model
##D mod2 <- sirt::xxirt( dat=dat, Theta=Theta, partable=partable, customItems=customItems,
##D                     customTheta=customTheta)
##D summary(mod2)
##D # compare sirt::xxirt and mirt::mirt
##D logLik(mod2)
##D mod1@Fit$logLik
##D 
##D #############################################################################
##D # EXAMPLE 2: Multiple choice dataset data.si06
##D #############################################################################
##D 
##D data(data.si06)
##D dat <- data.si06
##D 
##D #*** create latent responses
##D combis <- sirt::nedelsky.latresp(K)
##D I <- ncol(dat)
##D #*** define item response function
##D K <- 3
##D par <- c( 3, rep(-1,K), 1, rep(1,K+1),1)
##D names(par) <- c("K", paste0("b",1:K), "a", paste0("tau", 0:K),"thdim")
##D est <- c( FALSE, rep(TRUE,K), rep(FALSE, K+1 + 2 ) )
##D names(est) <- names(par)
##D nedelsky.icc <- function( par, Theta, ncat ){
##D      K <- par[1]
##D      b <- par[ 1:K + 1]
##D      a <- par[ K+2]
##D      tau <- par[1:(K+1) + (K+2) ]
##D      thdim <- par[ K+2+K+1 +1 ]
##D      probs <- sirt::nedelsky.irf( Theta, K=K, b=b, a=a, tau=tau, combis,
##D                     thdim=thdim  )$probs
##D      return(probs)
##D }
##D name <- "nedelsky"
##D # create item response function
##D nedelsky.itemfct <- mirt::createItem(name, par=par, est=est, P=nedelsky.icc)
##D 
##D #*** define model in mirt
##D mirtmodel <- mirt::mirt.model("
##D            F1=1-14
##D            COV=F1*F1
##D            PRIOR=(1-14,b1,norm,-1,2),(1-14,b2,norm,-1,2),
##D                    (1-14,b3,norm,-1,2)
##D         " )
##D 
##D itemtype <- rep("nedelsky", I )
##D customItems <- list("nedelsky"=nedelsky.itemfct)
##D # define parameters to be estimated
##D mod1.pars <- mirt::mirt(dat, mirtmodel, itemtype=itemtype,
##D                    customItems=customItems, pars="values")
##D 
##D #*** estimate model
##D mod1 <- mirt::mirt(dat,mirtmodel, itemtype=itemtype, customItems=customItems,
##D                pars=mod1.pars, verbose=TRUE )
##D #*** summaries
##D print(mod1)
##D summary(mod1)
##D mirt.wrapper.coef( mod1 )$coef
##D mirt.wrapper.itemplot(mod1,ask=TRUE)
## End(Not run)



