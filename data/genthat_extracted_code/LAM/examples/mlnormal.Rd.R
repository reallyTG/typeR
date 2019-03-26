library(LAM)


### Name: mlnormal
### Title: (Restricted) Maximum Likelihood Estimation with Prior
###   Distributions and Penalty Functions under Multivariate Normality
### Aliases: mlnormal summary.mlnormal print.mlnormal logLik.mlnormal
###   coef.mlnormal vcov.mlnormal confint.mlnormal

### ** Examples

## Not run: 
##D #############################################################################
##D # EXAMPLE 1: Two-level random intercept model
##D #############################################################################
##D 
##D #--------------------------------------------------------------
##D # Simulate data
##D #--------------------------------------------------------------
##D 
##D set.seed(976)
##D G <- 150 ; rg <- c(10,20)   # 150 groups with group sizes ranging from 10 to 20
##D #* simulate group sizes
##D ng <- round( stats::runif( G , min = rg[1] , max = rg[2] ) )
##D idcluster <- rep(1:G , ng )
##D #* simulate covariate
##D iccx <- .3
##D x <- rep( stats::rnorm( G , sd = sqrt( iccx) ) , ng ) +
##D             stats::rnorm( sum(ng) , sd = sqrt( 1 - iccx) )
##D #* simulate outcome
##D b0 <- 1.5 ; b1 <- .4 ; iccy <- .2
##D y <- b0 + b1*x + rep( stats::rnorm( G , sd = sqrt( iccy) ) , ng ) +
##D          stats::rnorm( sum(ng) , sd = sqrt( 1 - iccy) )
##D 
##D #-----------------------
##D #--- arrange input for mlnormal function
##D 
##D id <- idcluster          # cluster is identifier
##D X <- cbind( 1 , x )      # matrix of covariates
##D N <- length(id)          # number of units (clusters), which is G
##D 
##D MD <- max(ng)   # maximum number of persons in a group
##D NP <- 2         # number of covariance parameters theta
##D 
##D #* list of design matrix for covariance matrix
##D #  In the case of the random intercept model, the covariance structure is
##D #  tau^2 * J + sigma^2 * I, where J is a matrix of ones and I is the
##D #  identity matrix
##D Z <- as.list(1:G)
##D for (gg in 1:G){
##D     Ngg <- ng[gg]
##D     Z[[gg]] <- as.list( 1:2 )
##D     Z[[gg]][[1]] <- matrix( 1 , nrow=Ngg , ncol=Ngg )  # level 2 variance
##D     Z[[gg]][[2]] <- diag(1,Ngg)            # level 1 variance
##D }
##D Z_list <- Z
##D #* parameter list containing the powers of parameters
##D Z_index <- array( 0 , dim=c(G,2,2) )
##D Z_index[ 1:G , 1 , 1] <- Z_index[ 1:G , 2 , 2] <- 1
##D 
##D #** starting values and parameter names
##D beta <- c( 1 , 0 )
##D names(beta) <- c("int" , "x")
##D theta <- c( .05 , 1 )
##D names(theta) <- c("tau2" , "sig2" )
##D 
##D #** create dataset for lme4 for comparison
##D dat <- data.frame(y=y , x = x , id = id )
##D 
##D #--------------------------------------------------------------
##D # Model 1: Maximum likelihood estimation
##D #--------------------------------------------------------------
##D 
##D #** mlnormal function
##D mod1a <- LAM::mlnormal( y =y, X=X , id=id , Z_list=Z_list , Z_index =Z_index,
##D             beta = beta  , theta = theta, method= "ML" )
##D summary(mod1a)
##D 
##D # lme4::lmer function
##D library(lme4)
##D mod1b <- lme4::lmer( y ~ x + (1 | id )  , data = dat , REML = FALSE )
##D summary(mod1b)
##D 
##D #--------------------------------------------------------------
##D # Model 2: Restricted maximum likelihood estimation
##D #--------------------------------------------------------------
##D 
##D #** mlnormal function
##D mod2a <- LAM::mlnormal( y =y, X=X , id=id , Z_list=Z_list , Z_index =Z_index,
##D             beta = beta  , theta = theta, method= "REML" )
##D summary(mod2a)
##D 
##D # lme4::lmer function
##D mod2b <- lme4::lmer( y ~ x + (1 | id )  , data = dat , REML = TRUE )
##D summary(mod2b)
##D 
##D #--------------------------------------------------------------
##D # Model 3: Estimation of standard deviation instead of variances
##D #--------------------------------------------------------------
##D 
##D # The model is now parametrized in standard deviations
##D # Variances are then modeled as tau^2 and sigma^2, respectively.
##D Z_index2 <- 2*Z_index       # change loading matrix
##D 
##D # estimate model
##D mod3 <- LAM::mlnormal( y =y, X=X , id=id , Z_list=Z_list , Z_index =Z_index2,
##D             beta = beta  , theta = theta )
##D summary(mod3)
##D 
##D #--------------------------------------------------------------
##D # Model 4: Maximum posterior estimation
##D #--------------------------------------------------------------
##D 
##D # specify prior distributions for parameters
##D prior <- "
##D     tau2 ~ dgamma(NA , 2 , .5 )
##D     sig2 ~ dinvgamma(NA , .1 , .1 )
##D     x ~ dnorm( NA , .2 , 1000 )
##D     "
##D 
##D # estimate model in mlnormal
##D mod4 <- LAM::mlnormal( y =y, X=X , id=id , Z_list=Z_list , Z_index =Z_index,
##D             beta = beta, theta = theta, method= "REML", prior = prior, vcov = FALSE )
##D summary(mod4)
##D 
##D #--------------------------------------------------------------
##D # Model 5: Estimation with regularization on beta and theta parameters
##D #--------------------------------------------------------------
##D 
##D #*** penalty on theta parameter
##D lambda_theta <- 10
##D weights_theta <- 1 + 0 * theta
##D #*** penalty on beta parameter
##D lambda_beta <- 3
##D weights_beta <- c( 0 , 1.8 )
##D 
##D # estimate model
##D mod5 <- LAM::mlnormal( y=y, X=X, id=id , Z_list=Z_list , Z_index=Z_index,
##D             beta=beta, theta=theta, method= "ML" , maxit=maxit ,
##D             lambda_theta=lambda_theta, weights_theta=weights_theta ,
##D             lambda_beta=lambda_beta, weights_beta=weights_beta  )
##D summary(mod5)
##D 
##D #############################################################################
##D # EXAMPLE 2: Latent covariate model, two-level regression
##D #############################################################################
##D 
##D # Yb = beta_0 + beta_b*Xb + eb (between level) and
##D # Yw = beta_w*Xw + ew (within level)
##D 
##D #--------------------------------------------------------------
##D # Simulate data from latent covariate model
##D #--------------------------------------------------------------
##D 
##D set.seed(865)
##D # regression parameters
##D beta_0 <- 1 ; beta_b <- .7 ; beta_w <- .3
##D G <- 200      # number of groups
##D n <- 15      # group size
##D iccx <- .2   # intra class correlation x
##D iccy <- .35  # (conditional) intra class correlation y
##D # simulate latent variables
##D xb <- stats::rnorm(G , sd = sqrt( iccx ) )
##D yb <- beta_0 + beta_b * xb + stats::rnorm(G , sd = sqrt( iccy ) )
##D xw <- stats::rnorm(G*n , sd = sqrt( 1-iccx ) )
##D yw <- beta_w * xw + stats::rnorm(G*n , sd = sqrt( 1-iccy ) )
##D group <- rep( 1:G , each = n )
##D x <- xw + xb[ group ]
##D y <- yw + yb[ group ]
##D # test results on true data
##D lm( yb ~ xb )
##D lm( yw ~ xw )
##D 
##D # create vector of outcomes in the form
##D # ( y_11 , x_11 , y_21 , x_21 , ... )
##D dat <- cbind( y , x )
##D dat
##D Y <- as.vector( t(dat) )    # outcome vector
##D ny <- length(Y)
##D X <- matrix( 0 , nrow=ny , ncol=2 )
##D X[ seq(1,ny,2) , 1 ] <- 1   # design vector for mean y
##D X[ seq(2,ny,2) , 2 ] <- 1   # design vector for mean x
##D id <- rep( group , each = 2 )
##D 
##D #--------------------------------------------------------------
##D # Model 1: Linear regression ignoring multilevel structure
##D #--------------------------------------------------------------
##D 
##D # y = beta_0 + beta_t *x + e
##D # Var(y) = beta_t^2 * var_x + var_e
##D # Cov(y,x) = beta_t * var_x
##D # Var(x) = var_x
##D 
##D #** initial parameter values
##D theta <- c( 0 , 1 , .5 )
##D names(theta) <- c( "beta_t" , "var_x" , "var_e")
##D beta <- c(0,0)
##D names(beta) <- c("mu_y","mu_x")
##D 
##D # The unit i is a cluster in this example.
##D 
##D #--- define design matrices | list Z_list
##D Hlist <- list(  matrix( c(1,0,0,0) , 2 , 2 ) , # var(y)
##D                 matrix( c(1,0,0,0) , 2 , 2 ) , # var(y) (two terms)
##D                 matrix( c(0,1,1,0) , 2 , 2 ) , # cov(x,y)
##D                 matrix( c(0,0,0,1) , 2 , 2 ) ) # var(x)
##D 
##D U0 <- matrix( 0 , nrow=2*n  ,ncol=2*n )
##D Ulist <- list( U0 , U0 , U0 , U0 )
##D M <- length(Hlist)
##D for (mm in 1:M){    # mm <- 1
##D     for (nn in 1:n){     # nn <- 0
##D         Ulist[[ mm ]][ 2*(nn-1) + 1:2 , 2*(nn-1) + 1:2 ] <- Hlist[[ mm ]]
##D     }
##D }
##D Z_list <- as.list(1:G)
##D for (gg in 1:G){
##D     Z_list[[gg]] <- Ulist
##D }
##D 
##D #--- define index vectors
##D Z_index <- array( 0 , dim=c(G , 4 , 3 ) )
##D K0 <- matrix( 0 , nrow=4 , ncol=3 )
##D colnames(K0) <- names(theta)
##D # Var(y) = beta_t^2 * var_x + var_e  (matrices withn indices 1 and 2)
##D K0[ 1 , c("beta_t","var_x") ] <- c(2,1)  # beta_t^2 * var_x
##D K0[ 2 , c("var_e") ] <- c(1)  # var_e
##D # Cov(y,x) = beta_t * var_x
##D K0[ 3 , c("beta_t","var_x")] <- c(1,1)
##D # Var(x) = var_x
##D K0[ 4 , c("var_x") ] <- c(1)
##D for (gg in 1:G){
##D     Z_index[gg,,] <- K0
##D }
##D 
##D #*** estimate model with mlnormal
##D mod1a <- LAM::mlnormal( y=Y, X=X , id=id , Z_list=Z_list , Z_index=Z_index,
##D             beta=beta, theta=theta, method="REML" , vcov=FALSE )
##D summary(mod1a)
##D 
##D #*** estimate linear regression with stats::lm
##D mod1b <- stats::lm( y ~ x )
##D summary(mod1b)
##D 
##D #--------------------------------------------------------------
##D # Model 2: Latent covariate model
##D #--------------------------------------------------------------
##D 
##D #** initial parameters
##D theta <- c( 0.12 , .6 , .5 , 0 , .2 , .2 )
##D names(theta) <- c( "beta_w" , "var_xw" , "var_ew" ,
##D                 "beta_b" , "var_xb" , "var_eb")
##D 
##D #--- define design matrices | list Z_list
##D Hlist <- list(  matrix( c(1,0,0,0) , 2 , 2 ) , # var(y)
##D                 matrix( c(1,0,0,0) , 2 , 2 ) , # var(y) (two terms)
##D                 matrix( c(0,1,1,0) , 2 , 2 ) , # cov(x,y)
##D                 matrix( c(0,0,0,1) , 2 , 2 ) ) # var(x)
##D U0 <- matrix( 0 , nrow=2*n  ,ncol=2*n )
##D Ulist <- list( U0 , U0 , U0 , U0 ,  # within structure
##D                U0 , U0 , U0 , U0  )  # between structure
##D M <- length(Hlist)
##D #*** within structure
##D design_within <- diag(n)  # design matrix within structure
##D for (mm in 1:M){    # mm <- 1
##D     Ulist[[ mm ]] <- base::kronecker( design_within , Hlist[[mm]] )
##D }
##D #*** between structure
##D design_between <- matrix(1, nrow=n , ncol=n)
##D       # matrix of ones corresponding to group size
##D for (mm in 1:M){    # mm <- 1
##D     Ulist[[ mm + M ]] <-  base::kronecker( design_between , Hlist[[ mm ]] )
##D }
##D Z_list <- as.list(1:G)
##D for (gg in 1:G){
##D     Z_list[[gg]] <- Ulist
##D }
##D 
##D #--- define index vectors Z_index
##D Z_index <- array( 0 , dim=c(G , 8 , 6 ) )
##D K0 <- matrix( 0 , nrow=8 , ncol=6 )
##D colnames(K0) <- names(theta)
##D # Var(y) = beta^2 * var_x + var_e  (matrices withn indices 1 and 2)
##D K0[ 1 , c("beta_w","var_xw") ] <- c(2,1)  # beta_t^2 * var_x
##D K0[ 2 , c("var_ew") ] <- c(1)  # var_e
##D K0[ 5 , c("beta_b","var_xb") ] <- c(2,1)  # beta_t^2 * var_x
##D K0[ 6 , c("var_eb") ] <- c(1)  # var_e
##D # Cov(y,x) = beta * var_x
##D K0[ 3 , c("beta_w","var_xw")] <- c(1,1)
##D K0[ 7 , c("beta_b","var_xb")] <- c(1,1)
##D # Var(x) = var_x
##D K0[ 4 , c("var_xw") ] <- c(1)
##D K0[ 8 , c("var_xb") ] <- c(1)
##D for (gg in 1:G){
##D     Z_index[gg,,] <- K0
##D }
##D 
##D #--- estimate model with mlnormal
##D mod2a <- LAM::mlnormal( y=Y, X=X , id=id , Z_list=Z_list , Z_index=Z_index,
##D             beta=beta  , theta=theta, method="ML" )
##D summary(mod2a)
##D 
##D #############################################################################
##D # EXAMPLE 3: Simple linear regression, single level
##D #############################################################################
##D 
##D #--------------------------------------------------------------
##D # Simulate data
##D #--------------------------------------------------------------
##D 
##D set.seed(875)
##D N <- 300
##D x <- stats::rnorm( N , sd = 1.3 )
##D y <- .4 + .7 * x + stats::rnorm( N , sd = .5 )
##D dat <- data.frame( x , y )
##D 
##D #--------------------------------------------------------------
##D # Model 1: Linear regression modelled with residual covariance structure
##D #--------------------------------------------------------------
##D 
##D # matrix of predictros
##D X <- cbind( 1 , x )
##D # list with design matrices
##D Z <- as.list(1:N)
##D for (nn in 1:N){
##D     Z[[nn]] <- as.list( 1 )
##D     Z[[nn]][[1]] <- matrix( 1 , nrow=1, ncol=1 )  # residual variance
##D }
##D #* loading matrix
##D Z_index <- array( 0 , dim=c(N,1,1) )
##D Z_index[ 1:N , 1 , 1] <- 2  # parametrize residual standard deviation
##D #** starting values and parameter names
##D beta <- c( 0 , 0 )
##D names(beta) <- c("int" , "x")
##D theta <- c(1)
##D names(theta) <- c("sig2" )
##D # id vector
##D id <- 1:N
##D 
##D #** mlnormal function
##D mod1a <- LAM::mlnormal( y =y, X=X , id=id , Z_list=Z , Z_index =Z_index,
##D             beta = beta  , theta = theta, method= "ML" )
##D summary(mod1a)
##D 
##D # estimate linear regression with stats::lm
##D mod1b <- stats::lm( y ~ x )
##D summary(mod1b)
##D 
##D #--------------------------------------------------------------
##D # Model 2: Linear regression modelled with bivariate covariance structure
##D #--------------------------------------------------------------
##D 
##D #** define design matrix referring to mean structure
##D X <- matrix( 0 , nrow=2*N , ncol=2 )
##D X[ seq(1,2*N,2) , 1 ] <- X[ seq(2,2*N,2) , 2 ] <- 1
##D 
##D #** create outcome vector
##D y1 <- dat[ cbind( rep(1:N, each=2) , rep(1:2, N ) ) ]
##D #** list with design matrices
##D Z <- as.list(1:N)
##D Z0 <- 0*matrix( 0 , nrow=2,ncol=2)
##D ZXY <- ZY <- ZX <- Z0
##D # design matrix Var(X)
##D ZX[1,1] <- 1
##D # design matrix Var(Y)
##D ZY[2,2] <- 1
##D # design matrix covariance
##D ZXY[1,2] <- ZXY[2,1] <- 1
##D # Var(X) = sigx^2
##D # Cov(X,Y) = beta * sigx^2
##D # Var(Y) = beta^2 * sigx^2 + sige^2
##D Z_list0 <- list( ZY , ZY , ZXY , ZX )
##D for (nn in 1:N){
##D     Z[[nn]] <- Z_list0
##D }
##D #* parameter list containing the powers of parameters
##D theta <- c(1,0.3,1)
##D names(theta) <- c("sigx", "beta" , "sige" )
##D Z_index <- array( 0 , dim=c(N,4,3) )
##D for (nn in 1:N){
##D     # Var(X)
##D     Z_index[nn, 4 , ] <- c(2,0,0)
##D     # Cov(X,Y)
##D     Z_index[nn, 3, ] <- c(2,1,0)
##D     # Var(Y)
##D     Z_index[nn,1,] <- c(2,2,0)
##D     Z_index[nn,2,] <- c(0,0,2)
##D }
##D #** starting values and parameter names
##D beta <- c( 0 , 0 )
##D names(beta) <- c("Mx" , "My")
##D # id vector
##D id <- rep( 1:N , each=2 )
##D 
##D #** mlnormal function
##D mod2a <- LAM::mlnormal( y =y1, X=X , id=id , Z_list=Z , Z_index =Z_index,
##D             beta = beta  , theta = theta, method= "ML" )
##D summary(mod2a)
##D 
##D #--------------------------------------------------------------
##D # Model 3: Bivariate normal distribution in (sigma_X, sigma_Y, sigma_XY) parameters
##D #--------------------------------------------------------------
##D 
##D # list with design matrices
##D Z <- as.list(1:N)
##D Z0 <- 0*matrix( 0 , nrow=2,ncol=2)
##D ZXY <- ZY <- ZX <- Z0
##D # design matrix Var(X)
##D ZX[1,1] <- 1
##D # design matrix Var(Y)
##D ZY[2,2] <- 1
##D # design matrix covariance
##D ZXY[1,2] <- ZXY[2,1] <- 1
##D Z_list0 <- list( ZX , ZY , ZXY  )
##D for (nn in 1:N){
##D     Z[[nn]] <- Z_list0
##D }
##D 
##D #* parameter list
##D theta <- c(1,1,.3)
##D names(theta) <- c("sigx", "sigy" , "sigxy" )
##D Z_index <- array( 0 , dim=c(N,3,3) )
##D for (nn in 1:N){
##D     # Var(X)
##D     Z_index[nn, 1 , ] <- c(2,0,0)
##D     # Var(Y)
##D     Z_index[nn, 2 , ] <- c(0,2,0)
##D     # Cov(X,Y)
##D     Z_index[nn, 3, ] <- c(0,0,1)
##D }
##D 
##D #** starting values and parameter names
##D beta <- c( 0 , 0 )
##D names(beta) <- c("Mx" , "My")
##D 
##D #** mlnormal function
##D mod3a <- LAM::mlnormal( y =y1, X=X , id=id , Z_list=Z , Z_index =Z_index,
##D             beta = beta  , theta = theta, method= "ML" )
##D summary(mod3a)
##D 
##D #--------------------------------------------------------------
##D # Model 4: Bivariate normal distribution in parameters of Cholesky decomposition
##D #--------------------------------------------------------------
##D 
##D # list with design matrices
##D Z <- as.list(1:N)
##D Z0 <- 0*matrix( 0 , nrow=2,ncol=2)
##D ZXY <- ZY <- ZX <- Z0
##D # design matrix Var(X)
##D ZX[1,1] <- 1
##D # design matrix Var(Y)
##D ZY[2,2] <- 1
##D # design matrix covariance
##D ZXY[1,2] <- ZXY[2,1] <- 1
##D Z_list0 <- list( ZX , ZXY , ZY , ZY  )
##D for (nn in 1:N){
##D     Z[[nn]] <- Z_list0
##D }
##D 
##D #* parameter list containing the powers of parameters
##D theta <- c(1,0.3,1)
##D names(theta) <- c("L11", "L21" , "L22" )
##D Z_index <- array( 0 , dim=c(N,4,3) )
##D for (nn in 1:N){
##D     Z_index[nn,1,] <- c(2,0,0)
##D     Z_index[nn,2,] <- c(1,1,0)
##D     Z_index[nn,3,] <- c(0,2,0)
##D     Z_index[nn,4,] <- c(0,0,2)
##D }
##D #** starting values and parameter names
##D beta <- c( 0 , 0 )
##D names(beta) <- c("Mx" , "My")
##D # id vector
##D id <- rep( 1:N , each=2 )
##D #** mlnormal function
##D mod4a <- LAM::mlnormal( y =y1, X=X , id=id , Z_list=Z , Z_index =Z_index,
##D             beta = beta  , theta = theta, method= "ML" )
##D # parameter with lower diagonal entries of Cholesky matrix
##D mod4a$theta
##D # fill-in parameters for Cholesky matrix
##D L <- matrix(0,2,2)
##D L[ ! upper.tri(L) ] <- mod4a$theta
##D #** reconstruct covariance matrix
##D L ##D 
##D stats::cov.wt(dat, method="ML")$cov
## End(Not run)



