library(mBvs)


### Name: mzipBvs
### Title: The function to perform variable selection for multivariate
###   zero-inflated count responses
### Aliases: mzipBvs
### Keywords: multivariate Bayesian variable selection multivariate
###   zero-inflated count data

### ** Examples


## Not run: 
##D # loading a data set
##D data(simData_mzip)
##D Y <- simData_mzip$Y
##D data <- simData_mzip$X
##D 
##D n = dim(Y)[1]
##D q = dim(Y)[2]
##D 
##D form.bin     <- as.formula(~cov.1)
##D form.count    <- as.formula(~cov.1)
##D form.adj    <- as.formula(~1)
##D lin.pred <- list(form.bin, form.count, form.adj)
##D 
##D Xmat0 <- model.frame(lin.pred[[1]], data=data)
##D Xmat1 <- model.frame(lin.pred[[2]], data=data)
##D Xmat_adj <- model.frame(lin.pred[[3]], data=data)
##D 
##D p_adj = ncol(Xmat_adj)
##D p0 <- ncol(Xmat0) + p_adj
##D p1 <- ncol(Xmat1) + p_adj
##D 
##D nonz <- rep(NA, q)
##D for(j in 1:q) nonz[j] <- sum(Y[,j] != 0)
##D 
##D #####################
##D ## Hyperparameters ##
##D 
##D ## Generalized model
##D ##
##D rho0     <- q + 3 + 1
##D Psi0    <- diag(3, q)
##D 
##D mu_alpha0     <- 0
##D mu_alpha    <- rep(0, q)
##D 
##D mu_beta0    <- 0
##D mu_beta        <- rep(0, q)
##D 
##D a_alpha0    <- 0.7
##D b_alpha0     <- 0.7
##D 
##D a_alpha        <- rep(0.7, p0)
##D b_alpha     <- rep(0.7, p0)
##D 
##D a_beta0        <- 0.7
##D b_beta0     <- 0.7
##D 
##D a_beta        <- rep(0.7, p1)
##D b_beta         <- rep(0.7, p1)
##D 
##D v_beta = rep(1, q)
##D omega_beta = rep(0.1, p1-p_adj)
##D v_alpha = rep(1, q)
##D omega_alpha = rep(0.1, p0-p_adj)
##D 
##D ##
##D hyperParams.gen <- list(rho0=rho0, Psi0=Psi0, mu_alpha0=mu_alpha0, mu_alpha=mu_alpha,
##D mu_beta0=mu_beta0, mu_beta=mu_beta, a_alpha0=a_alpha0, b_alpha0=b_alpha0,
##D a_alpha=a_alpha, b_alpha=b_alpha, a_beta0=a_beta0, b_beta0=b_beta0,
##D a_beta=a_beta, b_beta=b_beta, v_beta=v_beta, omega_beta=omega_beta,
##D v_alpha=v_alpha, omega_alpha=omega_alpha)
##D 
##D ###################
##D ## MCMC SETTINGS ##
##D 
##D ## Setting for the overall run
##D ##
##D numReps    <- 100
##D thin       <- 1
##D burninPerc <- 0.5
##D 
##D ## Settings for storage
##D ##
##D storeV      <-    TRUE
##D storeW      <-    TRUE
##D 
##D ## Tuning parameters for specific updates
##D ##
##D ##  - Generalized model
##D beta0.prop.var    <- 0.5
##D alpha.prop.var    <- 0.5
##D beta.prop.var    <- 0.5
##D V.prop.var    <- 0.05
##D 
##D ##
##D mcmc.gen <- list(run=list(numReps=numReps, thin=thin, burninPerc=burninPerc),
##D storage=list(storeV=storeV, storeW=storeW),
##D tuning=list(beta0.prop.var=beta0.prop.var, alpha.prop.var=alpha.prop.var,
##D beta.prop.var=beta.prop.var, V.prop.var=V.prop.var))
##D 
##D #####################
##D ## Starting Values ##
##D 
##D ## Generalized model
##D ##
##D B <- matrix(0.1, p1, q, byrow = T)
##D A <- matrix(0.1, p0, q, byrow = T)
##D 
##D V <- matrix(rnorm(n*q, 0, 0.1), n, q)
##D W <- matrix(rnorm(n*q, 0, 0.1), n, q)
##D 
##D beta0 <- log(as.vector(apply(Y, 2, mean)))
##D alpha0 <- log(nonz/n / ((n-nonz)/n))
##D 
##D Sigma_V    <- matrix(0, q, q)
##D diag(Sigma_V) <- 1
##D 
##D R        <- matrix(0, q, q)
##D diag(R) <- 1
##D 
##D sigSq_alpha0 <- 1
##D sigSq_alpha <- rep(1, p0)
##D sigSq_beta0 <- 1
##D sigSq_beta <- rep(1, p1)
##D 
##D startValues.gen <- vector("list", 2)
##D startValues.gen[[1]] <- list(B=B, A=A, V=V, W=W, beta0=beta0, alpha0=alpha0, R=R,
##D sigSq_alpha0=sigSq_alpha0,
##D sigSq_alpha=sigSq_alpha, sigSq_beta0=sigSq_beta0, sigSq_beta=sigSq_beta, Sigma_V=Sigma_V)
##D 
##D B <- matrix(-0.1, p1, q, byrow = T)
##D A <- matrix(-0.1, p0, q, byrow = T)
##D 
##D V <- matrix(rnorm(n*q, 0, 0.1), n, q)
##D W <- matrix(rnorm(n*q, 0, 0.1), n, q)
##D 
##D Sigma_V    <- matrix(0.1, q, q)
##D diag(Sigma_V) <- 1.1
##D 
##D startValues.gen[[2]] <- list(B=B, A=A, V=V, W=W, beta0=beta0, alpha0=alpha0, R=R,
##D sigSq_alpha0=sigSq_alpha0,
##D sigSq_alpha=sigSq_alpha, sigSq_beta0=sigSq_beta0, sigSq_beta=sigSq_beta, Sigma_V=Sigma_V)
##D 
##D ###################################
##D ## Fitting the generalized model ##
##D ###################################
##D fit.gen <- mzipBvs(Y, lin.pred, data, model="generalized", offset=NULL, hyperParams.gen,
##D startValues.gen, mcmc.gen)
##D 
##D print(fit.gen)
##D summ.fit.gen <- summary(fit.gen); names(summ.fit.gen)
##D summ.fit.gen
##D 
## End(Not run)



