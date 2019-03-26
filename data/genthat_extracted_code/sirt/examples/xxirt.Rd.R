library(sirt)


### Name: xxirt
### Title: User Defined Item Response Model
### Aliases: xxirt summary.xxirt print.xxirt logLik.xxirt anova.xxirt
###   coef.xxirt vcov.xxirt confint.xxirt IRT.se.xxirt
###   IRT.expectedCounts.xxirt IRT.irfprob.xxirt IRT.likelihood.xxirt
###   IRT.posterior.xxirt IRT.modelfit.xxirt summary.IRT.modelfit.xxirt
###   IRT.factor.scores.xxirt xxirt_hessian

### ** Examples

## Not run: 
##D #############################################################################
##D ## EXAMPLE 1: Unidimensional item response functions
##D #############################################################################
##D 
##D data(data.read)
##D dat <- data.read
##D 
##D #------ Definition of item response functions
##D 
##D #*** IRF 2PL
##D P_2PL <- function( par, Theta, ncat){
##D     a <- par[1]
##D     b <- par[2]
##D     TP <- nrow(Theta)
##D     P <- matrix( NA, nrow=TP, ncol=ncat)
##D     P[,1] <- 1
##D     for (cc in 2:ncat){
##D         P[,cc] <- exp( (cc-1) * a * Theta[,1] - b )
##D     }
##D     P <- P / rowSums(P)
##D     return(P)
##D }
##D 
##D #*** IRF 1PL
##D P_1PL <- function( par, Theta, ncat){
##D     b <- par[1]
##D     TP <- nrow(Theta)
##D     P <- matrix( NA, nrow=TP, ncol=ncat)
##D     P[,1] <- 1
##D     for (cc in 2:ncat){
##D         P[,cc] <- exp( (cc-1) * Theta[,1] - b )
##D     }
##D     P <- P / rowSums(P)
##D     return(P)
##D }
##D 
##D #** created item classes of 1PL and 2PL models
##D par <- c( "a"=1, "b"=0 )
##D # define some slightly informative prior of 2PL
##D item_2PL <- sirt::xxirt_createDiscItem( name="2PL", par=par, est=c(TRUE,TRUE),
##D                P=P_2PL, prior=c(a="dlnorm"), prior_par1=c( a=0 ),
##D                prior_par2=c(a=5) )
##D item_1PL <- sirt::xxirt_createDiscItem( name="1PL", par=par[2], est=c(TRUE),
##D                P=P_1PL )
##D customItems <- list( item_1PL,  item_2PL )
##D 
##D #---- definition theta distribution
##D 
##D #** theta grid
##D Theta <- matrix( seq(-6,6,length=21), ncol=1 )
##D 
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
##D customTheta  <- sirt::xxirt_createThetaDistribution( par=par_Theta, est=c(FALSE,TRUE),
##D                        P=P_Theta1 )
##D 
##D #****************************************************************************
##D #******* Model 1: Rasch model
##D 
##D #-- create parameter table
##D itemtype <- rep( "1PL", 12 )
##D partable <- sirt::xxirt_createParTable( dat, itemtype=itemtype,
##D                         customItems=customItems )
##D 
##D # estimate model
##D mod1 <- sirt::xxirt( dat=dat, Theta=Theta, partable=partable,
##D                    customItems=customItems, customTheta=customTheta)
##D summary(mod1)
##D 
##D # estimate Rasch model by providing starting values
##D partable1 <- sirt::xxirt_modifyParTable( partable, parname="b",
##D                    value=- stats::qlogis( colMeans(dat) ) )
##D # estimate model again
##D mod1b <- sirt::xxirt( dat=dat, Theta=Theta, partable=partable1,
##D                    customItems=customItems, customTheta=customTheta )
##D summary(mod1b)
##D 
##D # extract coefficients, covariance matrix and standard errors
##D coef(mod1b)
##D vcov(mod1b)
##D IRT.se(mod1b)
##D 
##D #****************************************************************************
##D #******* Model 2: 2PL Model with three groups of item discriminations
##D 
##D #-- create parameter table
##D itemtype <- rep( "2PL", 12 )
##D partable <- sirt::xxirt_createParTable( dat, itemtype=itemtype, customItems=customItems)
##D # modify parameter table: set constraints for item groups A, B and C
##D partable1 <- sirt::xxirt_modifyParTable(partable, item=paste0("A",1:4),
##D                          parname="a", parindex=111)
##D partable1 <- sirt::xxirt_modifyParTable(partable1, item=paste0("B",1:4),
##D                          parname="a", parindex=112)
##D partable1 <- sirt::xxirt_modifyParTable(partable1, item=paste0("C",1:4),
##D                          parname="a", parindex=113)
##D # delete prior distributions
##D partable1 <- sirt::xxirt_modifyParTable(partable1, parname="a", prior=NA)
##D 
##D #-- fix sigma to 1
##D customTheta1 <- customTheta
##D customTheta1$est <- c("mu"=FALSE,"sigma"=FALSE )
##D 
##D # estimate model
##D mod2 <- sirt::xxirt( dat=dat, Theta=Theta, partable=partable1,
##D                   customItems=customItems, customTheta=customTheta1 )
##D summary(mod2)
##D 
##D #****************************************************************************
##D #******* Model 3: Cloglog link function
##D 
##D #*** IRF cloglog
##D P_1N <- function( par, Theta, ncat){
##D     b <- par
##D     TP <- nrow(Theta)
##D     P <- matrix( NA, nrow=TP, ncol=ncat)
##D     P[,2] <- 1 - exp( - exp( Theta - b ) )
##D     P[,1] <- 1 - P[,2]
##D     return(P)
##D }
##D par <- c("b"=0)
##D item_1N <- sirt::xxirt_createDiscItem( name="1N", par=par, est=c(TRUE),
##D                     P=P_1N )
##D customItems <- list( item_1N )
##D itemtype <- rep( "1N", I )
##D partable <- sirt::xxirt_createParTable( dat[,items], itemtype=itemtype,
##D                       customItems=customItems )
##D partable <- sirt::xxirt_modifyParTable( partable=partable, parname="b",
##D                  value=- stats::qnorm( colMeans(dat[,items] )) )
##D 
##D #*** estimate model
##D mod3 <- sirt::xxirt( dat=dat, Theta=Theta, partable=partable, customItems=customItems,
##D                 customTheta=customTheta )
##D summary(mod3)
##D IRT.compareModels(mod1,mod3)
##D 
##D #****************************************************************************
##D #******* Model 4: Latent class model
##D 
##D K <- 3 # number of classes
##D Theta <- diag(K)
##D 
##D #*** Theta distribution
##D P_Theta1 <- function( par, Theta, G  ){
##D     logitprobs <- par[1:(K-1)]
##D     l1 <- exp( c( logitprobs, 0 ) )
##D     probs <- matrix( l1/sum(l1), ncol=1)
##D     return(probs)
##D }
##D 
##D par_Theta <- stats::qlogis( rep( 1/K, K-1 ) )
##D names(par_Theta) <- paste0("pi",1:(K-1) )
##D customTheta  <- sirt::xxirt_createThetaDistribution( par=par_Theta,
##D                      est=rep(TRUE,K-1), P=P_Theta1)
##D 
##D #*** IRF latent class
##D P_lc <- function( par, Theta, ncat){
##D     b <- par
##D     TP <- nrow(Theta)
##D     P <- matrix( NA, nrow=TP, ncol=ncat)
##D     P[,1] <- 1
##D     for (cc in 2:ncat){
##D         P[,cc] <- exp( Theta %*% b )
##D     }
##D     P <- P / rowSums(P)
##D     return(P)
##D }
##D par <- seq( -1.5, 1.5, length=K )
##D names(par) <- paste0("b",1:K)
##D item_lc <- sirt::xxirt_createDiscItem( name="LC", par=par,
##D                  est=rep(TRUE,K), P=P_lc )
##D customItems <- list( item_lc )
##D 
##D # create parameter table
##D itemtype <- rep( "LC", 12 )
##D partable <- sirt::xxirt_createParTable( dat, itemtype=itemtype, customItems=customItems)
##D partable
##D 
##D #*** estimate model
##D mod4 <- sirt::xxirt( dat=dat, Theta=Theta, partable=partable, customItems=customItems,
##D                 customTheta=customTheta)
##D summary(mod4)
##D # class probabilities
##D mod4$probs_Theta
##D # item response functions
##D imod4 <- IRT.irfprob( mod5 )
##D round( imod4[,2,], 3 )
##D 
##D #****************************************************************************
##D #******* Model 5: Ordered latent class model
##D 
##D K <- 3 # number of classes
##D Theta <- diag(K)
##D Theta <- apply( Theta, 1, cumsum )
##D 
##D #*** Theta distribution
##D P_Theta1 <- function( par, Theta, G  ){
##D     logitprobs <- par[1:(K-1)]
##D     l1 <- exp( c( logitprobs, 0 ) )
##D     probs <- matrix( l1/sum(l1), ncol=1)
##D     return(probs)
##D }
##D par_Theta <- stats::qlogis( rep( 1/K, K-1 ) )
##D names(par_Theta) <- paste0("pi",1:(K-1) )
##D customTheta  <- sirt::xxirt_createThetaDistribution( par=par_Theta,
##D                 est=rep(TRUE,K-1), P=P_Theta1  )
##D 
##D #*** IRF ordered latent class
##D P_olc <- function( par, Theta, ncat){
##D     b <- par
##D     TP <- nrow(Theta)
##D     P <- matrix( NA, nrow=TP, ncol=ncat)
##D     P[,1] <- 1
##D     for (cc in 2:ncat){
##D         P[,cc] <- exp( Theta %*% b )
##D     }
##D     P <- P / rowSums(P)
##D     return(P)
##D }
##D 
##D par <- c( -1, rep( .5,, length=K-1 ) )
##D names(par) <- paste0("b",1:K)
##D item_olc <- sirt::xxirt_createDiscItem( name="OLC", par=par, est=rep(TRUE,K),
##D                     P=P_olc, lower=c( -Inf, 0, 0 ) )
##D customItems <- list( item_olc )
##D itemtype <- rep( "OLC", 12 )
##D partable <- sirt::xxirt_createParTable( dat, itemtype=itemtype, customItems=customItems)
##D partable
##D 
##D #*** estimate model
##D mod5 <- sirt::xxirt( dat=dat, Theta=Theta, partable=partable, customItems=customItems,
##D                 customTheta=customTheta )
##D summary(mod5)
##D # estimated item response functions
##D imod5 <- IRT.irfprob( mod5 )
##D round( imod5[,2,], 3 )
##D 
##D #############################################################################
##D ## EXAMPLE 2: Multiple group models with xxirt
##D #############################################################################
##D 
##D data(data.math)
##D dat <- data.math$data
##D items <- grep( "M[A-Z]", colnames(dat), value=TRUE )
##D I <- length(items)
##D 
##D Theta <- matrix( seq(-8,8,len=31), ncol=1 )
##D 
##D #****************************************************************************
##D #******* Model 1: Rasch model, single group
##D 
##D #*** Theta distribution
##D P_Theta1 <- function( par, Theta, G  ){
##D     mu <- par[1]
##D     sigma <- max( par[2], .01 )
##D     p1 <- stats::dnorm( Theta[,1], mean=mu, sd=sigma)
##D     p1 <- p1 / sum(p1)
##D     probs <- matrix( p1, ncol=1)
##D     return(probs)
##D }
##D 
##D par_Theta <- c(0,1)
##D names(par_Theta) <- c("mu","sigma")
##D customTheta  <- sirt::xxirt_createThetaDistribution( par=par_Theta,
##D                    est=c(FALSE,TRUE), P=P_Theta1  )
##D customTheta
##D 
##D #*** IRF 1PL logit
##D P_1PL <- function( par, Theta, ncat){
##D     b <- par
##D     TP <- nrow(Theta)
##D     P <- matrix( NA, nrow=TP, ncol=ncat)
##D     P[,2] <- plogis( Theta - b )
##D     P[,1] <- 1 - P[,2]
##D     return(P)
##D }
##D par <- c("b"=0)
##D item_1PL <- sirt::xxirt_createDiscItem( name="1PL", par=par, est=c(TRUE), P=P_1PL)
##D customItems <- list( item_1PL )
##D 
##D itemtype <- rep( "1PL", I )
##D partable <- sirt::xxirt_createParTable( dat[,items], itemtype=itemtype,
##D                        customItems=customItems )
##D partable <- sirt::xxirt_modifyParTable( partable=partable, parname="b",
##D                   value=- stats::qlogis( colMeans(dat[,items] )) )
##D 
##D #*** estimate model
##D mod1 <- sirt::xxirt( dat=dat[,items], Theta=Theta, partable=partable,
##D                 customItems=customItems, customTheta=customTheta )
##D summary(mod1)
##D 
##D #****************************************************************************
##D #******* Model 2: Rasch model, multiple groups
##D 
##D #*** Theta distribution
##D P_Theta2 <- function( par, Theta, G  ){
##D     mu1 <- par[1]
##D     mu2 <- par[2]
##D     sigma1 <- max( par[3], .01 )
##D     sigma2 <- max( par[4], .01 )
##D     TP <- nrow(Theta)
##D     probs <- matrix( NA, nrow=TP, ncol=G)
##D     p1 <- stats::dnorm( Theta[,1], mean=mu1, sd=sigma1)
##D     probs[,1] <- p1 / sum(p1)
##D     p1 <- stats::dnorm( Theta[,1], mean=mu2, sd=sigma2)
##D     probs[,2] <- p1 / sum(p1)
##D     return(probs)
##D }
##D par_Theta <- c(0,0,1,1)
##D names(par_Theta) <- c("mu1","mu2","sigma1","sigma2")
##D customTheta2  <- sirt::xxirt_createThetaDistribution( par=par_Theta,
##D                     est=c(FALSE,TRUE,TRUE,TRUE), P=P_Theta2  )
##D customTheta2
##D 
##D #*** estimate model
##D mod2 <- sirt::xxirt( dat=dat[,items], group=dat$female, Theta=Theta, partable=partable,
##D            customItems=customItems, customTheta=customTheta2, maxit=40)
##D summary(mod2)
##D IRT.compareModels(mod1, mod2)
##D 
##D #*** compare results with TAM package
##D library(TAM)
##D mod2b <- TAM::tam.mml( resp=dat[,items], group=dat$female )
##D summary(mod2b)
##D IRT.compareModels(mod1, mod2, mod2b)
## End(Not run)



