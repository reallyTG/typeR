library(sirt)


### Name: gom.em
### Title: Discrete (Rasch) Grade of Membership Model
### Aliases: gom.em summary.gom logLik.gom anova.gom IRT.irfprob.gom
###   IRT.likelihood.gom IRT.posterior.gom IRT.modelfit.gom
###   summary.IRT.modelfit.gom
### Keywords: Grade of membership model Rasch grade of membership model
###   summary

### ** Examples

#############################################################################
# EXAMPLE 1: PISA data mathematics
#############################################################################

data(data.pisaMath)
dat <- data.pisaMath$data
dat <- dat[, grep("M", colnames(dat)) ]

#***
# Model 1: Discrete GOM with 3 classes and 5 probability levels
problevels <- seq( 0, 1, len=5 )
mod1 <- sirt::gom.em( dat, K=3, problevels,  model="GOM"  )
summary(mod1)

## Not run: 
##D #***
##D # Model 2: Discrete GOM with 4 classes and 5 probability levels
##D problevels <- seq( 0, 1, len=5 )
##D mod2 <- sirt::gom.em( dat, K=4, problevels,  model="GOM"  )
##D summary(mod2)
##D 
##D # model comparison
##D smod1 <- IRT.modelfit(mod1)
##D smod2 <- IRT.modelfit(mod2)
##D IRT.compareModels(smod1,smod2)
##D 
##D #***
##D # Model 2a: Estimate discrete GOM with 4 classes and restricted space of probability levels
##D #  the 2nd, 4th and 6th class correspond to "intermediate stages"
##D problevels <- scan()
##D  1  0  0  0
##D .5 .5  0  0
##D  0  1  0  0
##D  0 .5 .5  0
##D  0  0  1  0
##D  0  0 .5 .5
##D  0  0  0  1
##D 
##D problevels <- matrix( problevels, ncol=4, byrow=TRUE)
##D mod2a <- sirt::gom.em( dat, K=4, problevels,  model="GOM" )
##D # probability distribution for latent classes
##D cbind( mod2a$theta.k, mod2a$pi.k )
##D   ##        [,1] [,2] [,3] [,4]       [,5]
##D   ##   [1,]  1.0  0.0  0.0  0.0 0.17214630
##D   ##   [2,]  0.5  0.5  0.0  0.0 0.04965676
##D   ##   [3,]  0.0  1.0  0.0  0.0 0.09336660
##D   ##   [4,]  0.0  0.5  0.5  0.0 0.06555719
##D   ##   [5,]  0.0  0.0  1.0  0.0 0.27523678
##D   ##   [6,]  0.0  0.0  0.5  0.5 0.08458620
##D   ##   [7,]  0.0  0.0  0.0  1.0 0.25945016
## End(Not run)

#***
# Model 3: Rasch GOM
mod3 <- sirt::gom.em( dat, model="GOMRasch", maxiter=20 )
summary(mod3)

#***
# Model 4: 'Ordinary' Rasch model
mod4 <- sirt::rasch.mml2( dat )
summary(mod4)

## Not run: 
##D #############################################################################
##D # EXAMPLE 2: Grade of membership model with 2 classes
##D #############################################################################
##D 
##D #********* DATASET 1 *************
##D # define an ordinary 2 latent class model
##D set.seed(8765)
##D I <- 10
##D prob.class1 <- stats::runif( I, 0, .35 )
##D prob.class2 <- stats::runif( I, .70, .95 )
##D probs <- cbind( prob.class1, prob.class2 )
##D 
##D # define classes
##D N <- 1000
##D latent.class <- c( rep( 1, 1/4*N ), rep( 2,3/4*N ) )
##D 
##D # simulate item responses
##D dat <- matrix( NA, nrow=N, ncol=I )
##D for (ii in 1:I){
##D     dat[,ii] <- probs[ ii, latent.class ]
##D     dat[,ii] <- 1 * ( stats::runif(N) < dat[,ii] )
##D         }
##D colnames(dat) <- paste0( "I", 1:I)
##D 
##D # Model 1: estimate latent class model
##D mod1 <- sirt::gom.em(dat, K=2, problevels=c(0,1), model="GOM" )
##D summary(mod1)
##D # Model 2: estimate GOM
##D mod2 <- sirt::gom.em(dat, K=2, problevels=seq(0,1,0.5), model="GOM" )
##D summary(mod2)
##D # estimated distribution
##D cbind( mod2$theta.k, mod2$pi.k )
##D   ##       [,1] [,2]        [,3]
##D   ##  [1,]  1.0  0.0 0.243925644
##D   ##  [2,]  0.5  0.5 0.006534278
##D   ##  [3,]  0.0  1.0 0.749540078
##D 
##D #********* DATASET 2 *************
##D # define a 2-class model with graded membership
##D set.seed(8765)
##D I <- 10
##D prob.class1 <- stats::runif( I, 0, .35 )
##D prob.class2 <- stats::runif( I, .70, .95 )
##D prob.class3 <- .5*prob.class1+.5*prob.class2  # probabilities for 'fuzzy class'
##D probs <- cbind( prob.class1, prob.class2, prob.class3)
##D # define classes
##D N <- 1000
##D latent.class <- c( rep(1,round(1/3*N)),rep(2,round(1/2*N)),rep(3,round(1/6*N)))
##D # simulate item responses
##D dat <- matrix( NA, nrow=N, ncol=I )
##D for (ii in 1:I){
##D     dat[,ii] <- probs[ ii, latent.class ]
##D     dat[,ii] <- 1 * ( stats::runif(N) < dat[,ii] )
##D         }
##D colnames(dat) <- paste0( "I", 1:I)
##D 
##D #** Model 1: estimate latent class model
##D mod1 <- sirt::gom.em(dat, K=2, problevels=c(0,1), model="GOM" )
##D summary(mod1)
##D 
##D #** Model 2: estimate GOM
##D mod2 <- sirt::gom.em(dat, K=2, problevels=seq(0,1,0.5), model="GOM" )
##D summary(mod2)
##D # inspect distribution
##D cbind( mod2$theta.k, mod2$pi.k )
##D   ##       [,1] [,2]      [,3]
##D   ##  [1,]  1.0  0.0 0.3335666
##D   ##  [2,]  0.5  0.5 0.1810114
##D   ##  [3,]  0.0  1.0 0.4854220
##D 
##D #***
##D # Model2m: estimate discrete GOM in mirt
##D # define latent classes
##D Theta <- scan( nlines=1)
##D    1 0   .5 .5    0 1
##D Theta <- matrix( Theta, nrow=3, ncol=2,byrow=TRUE)
##D # define mirt model
##D I <- ncol(dat)
##D #*** create customized item response function for mirt model
##D name <- 'gom'
##D par <- c("a1"=-1, "a2"=1 )
##D est <- c(TRUE, TRUE)
##D P.gom <- function(par,Theta,ncat){
##D     # GOM for two extremal classes
##D     pext1 <- stats::plogis(par[1])
##D     pext2 <- stats::plogis(par[2])
##D     P1 <- Theta[,1]*pext1 + Theta[,2]*pext2
##D     cbind(1-P1, P1)
##D }
##D # create item response function
##D icc_gom <- mirt::createItem(name, par=par, est=est, P=P.gom)
##D #** define prior for latent class analysis
##D lca_prior <- function(Theta,Etable){
##D   # number of latent Theta classes
##D   TP <- nrow(Theta)
##D   # prior in initial iteration
##D   if ( is.null(Etable) ){ prior <- rep( 1/TP, TP ) }
##D   # process Etable (this is correct for datasets without missing data)
##D   if ( ! is.null(Etable) ){
##D     # sum over correct and incorrect expected responses
##D     prior <- ( rowSums(Etable[, seq(1,2*I,2)]) + rowSums(Etable[,seq(2,2*I,2)]) )/I
##D                  }
##D   prior <- prior / sum(prior)
##D   return(prior)
##D }
##D #*** estimate discrete GOM in mirt package
##D mod2m <- mirt::mirt(dat, 1, rep( "icc_gom",I), customItems=list("icc_gom"=icc_gom),
##D            technical=list( customTheta=Theta, customPriorFun=lca_prior)  )
##D # correct number of estimated parameters
##D mod2m@nest <- as.integer(sum(mod.pars$est) + nrow(Theta)-1 )
##D # extract log-likelihood and compute AIC and BIC
##D mod2m@logLik
##D ( AIC <- -2*mod2m@logLik+2*mod2m@nest )
##D ( BIC <- -2*mod2m@logLik+log(mod2m@Data$N)*mod2m@nest )
##D # extract coefficients
##D ( cmod2m <- sirt::mirt.wrapper.coef(mod2m) )
##D # compare estimated distributions
##D round( cbind( "sirt"=mod2$pi.k, "mirt"=mod2m@Prior[[1]] ), 5 )
##D   ##           sirt    mirt
##D   ##   [1,] 0.33357 0.33627
##D   ##   [2,] 0.18101 0.17789
##D   ##   [3,] 0.48542 0.48584
##D # compare estimated item parameters
##D dfr <- data.frame( "sirt"=mod2$item[,4:5] )
##D dfr$mirt <- apply(cmod2m$coef[, c("a1", "a2") ], 2, stats::plogis )
##D round(dfr,4)
##D   ##      sirt.lam.Cl1 sirt.lam.Cl2 mirt.a1 mirt.a2
##D   ##   1        0.1157       0.8935  0.1177  0.8934
##D   ##   2        0.0790       0.8360  0.0804  0.8360
##D   ##   3        0.0743       0.8165  0.0760  0.8164
##D   ##   4        0.0398       0.8093  0.0414  0.8094
##D   ##   5        0.1273       0.7244  0.1289  0.7243
##D   ##   [...]
## End(Not run)



