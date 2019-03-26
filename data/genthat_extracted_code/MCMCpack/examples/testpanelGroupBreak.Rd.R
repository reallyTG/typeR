library(MCMCpack)


### Name: testpanelGroupBreak
### Title: A Test for the Group-level Break using a Multivariate Linear
###   Regression Model with Breaks
### Aliases: testpanelGroupBreak
### Keywords: models

### ** Examples


## Not run: 
##D    ## data generating
##D   set.seed(1977)
##D   Q <- 3
##D   true.beta1   <-  c(1, 1, 1) ; true.beta2   <-  c(1, -1, -1)
##D   true.sigma2 <-  c(1, 3); true.D1 <- diag(.5, Q); true.D2 <- diag(2.5, Q)
##D   N=20; T=100;
##D   NT <- N*T
##D   x1 <- rnorm(NT)
##D   x2 <- runif(NT, 5, 10)
##D   X <- cbind(1, x1, x2);   W <- X;   y <- rep(NA, NT)
##D 
##D   ## true break numbers are one and at the center
##D   break.point = rep(T/2, N); break.sigma=c(rep(1, N));
##D   break.list <- rep(1, N)
##D   id  <-  rep(1:N, each=NT/N)
##D   K <-  ncol(X);
##D   ruler <- c(1:T)
##D 
##D   ## compute the weight for the break
##D   W.mat <- matrix(NA, T, N)
##D   for (i in 1:N){
##D     W.mat[, i] <- pnorm((ruler-break.point[i])/break.sigma[i])
##D   }
##D   Weight <- as.vector(W.mat)
##D 
##D   ## data generating by weighting two means and variances
##D   j = 1
##D   for (i in 1:N){
##D     Xi <- X[j:(j+T-1), ]
##D     Wi <- W[j:(j+T-1), ]
##D     true.V1 <- true.sigma2[1]*diag(T) + Wi%*%true.D1%*%t(Wi)
##D     true.V2 <- true.sigma2[2]*diag(T) + Wi%*%true.D2%*%t(Wi)
##D     true.mean1 <- Xi%*%true.beta1
##D     true.mean2 <- Xi%*%true.beta2
##D     weight <- Weight[j:(j+T-1)]
##D     y[j:(j+T-1)] <- (1-weight)*true.mean1 + (1-weight)*chol(true.V1)%*%rnorm(T) +
##D       weight*true.mean2 + weight*chol(true.V2)%*%rnorm(T)
##D     j <- j + T
##D   }
##D   ## model fitting
##D   subject.id <- c(rep(1:N, each=T))
##D   time.id <- c(rep(1:T, N))
##D 
##D 
##D   resid <- rstandard(lm(y ~X-1 + as.factor(subject.id)))
##D   G <- 100
##D   out0 <- testpanelGroupBreak(subject.id, time.id, resid, m=0,
##D            mcmc=G, burnin=G, thin=1, verbose=G,
##D            b0=0, B0=1/100, c0=2, d0=2, marginal.likelihood = "Chib95")
##D   out1 <- testpanelGroupBreak(subject.id, time.id, resid, m=1,
##D            mcmc=G, burnin=G, thin=1, verbose=G,
##D            b0=0, B0=1/100, c0=2, d0=2, marginal.likelihood = "Chib95")
##D   out2 <- testpanelGroupBreak(subject.id, time.id, resid, m=2,
##D            mcmc=G, burnin=G, thin=1, verbose=G,
##D            b0=0, B0=1/100, c0=2, d0=2, marginal.likelihood = "Chib95")
##D   out3 <- testpanelGroupBreak(subject.id, time.id, resid, m=3,
##D            mcmc=G, burnin=G, thin=1, verbose=G,
##D            b0=0, B0=1/100, c0=2, d0=2, marginal.likelihood = "Chib95")
##D 
##D   ## Note that the code is for a hypothesis test of no break in panel residuals.
##D   ## When breaks exist, the estimated number of break in the mean and variance of panel residuals
##D   ## tends to be larger than the number of break in the data generating process.
##D   ## This is due to the difference in parameter space, not an error of the code.
##D   BayesFactor(out0, out1, out2, out3)
##D 
##D   ## In order to identify the number of breaks in panel parameters,
##D   ## use HMMpanelRE() instead.
##D 
## End(Not run)




