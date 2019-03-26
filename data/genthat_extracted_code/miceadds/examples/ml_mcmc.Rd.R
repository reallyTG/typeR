library(miceadds)


### Name: ml_mcmc
### Title: MCMC Estimation for Mixed Effects Model
### Aliases: ml_mcmc ml_mcmc_fit plot.ml_mcmc summary.ml_mcmc coef.ml_mcmc
###   vcov.ml_mcmc miceadds_rcpp_ml_mcmc_sample_beta
###   miceadds_rcpp_ml_mcmc_sample_u miceadds_rcpp_ml_mcmc_sample_psi
###   miceadds_rcpp_ml_mcmc_sample_sigma2
###   miceadds_rcpp_ml_mcmc_sample_latent_probit
###   miceadds_rcpp_ml_mcmc_sample_thresholds
###   miceadds_rcpp_ml_mcmc_predict_fixed_random
###   miceadds_rcpp_ml_mcmc_predict_random_list
###   miceadds_rcpp_ml_mcmc_predict_random
###   miceadds_rcpp_ml_mcmc_predict_fixed
###   miceadds_rcpp_ml_mcmc_subtract_fixed
###   miceadds_rcpp_ml_mcmc_subtract_random
###   miceadds_rcpp_ml_mcmc_compute_ztz miceadds_rcpp_ml_mcmc_compute_xtx
###   miceadds_rcpp_ml_mcmc_probit_category_prob miceadds_rcpp_pnorm
###   miceadds_rcpp_qnorm miceadds_rcpp_rtnorm

### ** Examples

## Not run: 
##D #############################################################################
##D # EXAMPLE 1: Multilevel model continuous data
##D #############################################################################
##D 
##D library(lme4)
##D 
##D #*** simulate data
##D set.seed(9097)
##D 
##D # number of clusters and units within clusters
##D K <- 150
##D n <- 15
##D iccx <- .2
##D idcluster <- rep( 1:K, each=n )
##D w <- stats::rnorm( K )
##D x <- rep( stats::rnorm( K, sd=sqrt(iccx) ), each=n) +
##D                stats::rnorm( n*K, sd=sqrt( 1 - iccx ))
##D X <- data.frame(int=1, "x"=x, xaggr=miceadds::gm(x, idcluster),
##D         w=rep( w, each=n ) )
##D X <- as.matrix(X)
##D Sigma <- diag( c(2, .5 ) )
##D u <- MASS::mvrnorm( K, mu=c(0,0), Sigma=Sigma )
##D beta <- c( 0, .3, .7, 1 )
##D Z <- X[, c("int", "x") ]
##D ypred <- as.matrix(X) %*% beta + rowSums( Z * u[ idcluster, ] )
##D y <- ypred[,1] + stats::rnorm( n*K, sd=1 )
##D data <- as.data.frame(X)
##D data$idcluster <- idcluster
##D data$y <- y
##D 
##D #*** estimate mixed effects model with miceadds::ml_mcmc() function
##D formula <- y ~ x + miceadds::gm(x, idcluster) + w + ( 1 + x | idcluster)
##D mod1 <- miceadds::ml_mcmc( formula, data)
##D plot(mod1)
##D summary(mod1)
##D 
##D #*** compare results with lme4 package
##D mod2 <- lme4::lmer(formula, data=data)
##D summary(mod2)
##D 
##D #############################################################################
##D # EXAMPLE 2: Multilevel model for ordinal outcome
##D #############################################################################
##D 
##D #*** simulate data
##D set.seed(456)
##D # number of clusters and units within cluster
##D K <- 500
##D n <- 10
##D iccx <- .2
##D idcluster <- rep( 1:K, each=n )
##D w <- rnorm( K )
##D x <- rep( stats::rnorm( K, sd=sqrt(iccx)), each=n) +
##D                  stats::rnorm( n*K, sd=sqrt( 1 - iccx ))
##D X <- data.frame("int"=1, "x"=x, "xaggr"=miceadds::gm(x, idcluster),
##D         w=rep( w, each=n ) )
##D X <- as.matrix(X)
##D u <- matrix( stats::rnorm(K, sd=sqrt(.5) ), ncol=1)
##D beta <- c( 0, .3, .7, 1 )
##D Z <- X[, c("int") ]
##D ypred <- as.matrix(X) %*% beta + Z * u[ idcluster, ]
##D y <- ypred[,1] + stats::rnorm( n*K, sd=1 )
##D data <- as.data.frame(X)
##D data$idcluster <- idcluster
##D alpha <- c(-Inf, -.4, 0, 1.7,  Inf)
##D data$y <- cut( y, breaks=alpha, labels=FALSE ) - 1
##D 
##D #*** estimate model
##D formula <- y ~ miceadds::cwc(x, idcluster) + miceadds::gm(x,idcluster) + w + ( 1 | idcluster)
##D mod <- miceadds::ml_mcmc( formula, data, iter=2000, burnin=500, outcome="probit",
##D                 inits_lme4=FALSE)
##D summary(mod)
##D plot(mod)
## End(Not run)



