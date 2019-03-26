library(MCMCpack)


### Name: HMMpanelRE
### Title: Markov Chain Monte Carlo for the Hidden Markov Random-effects
###   Model
### Aliases: HMMpanelRE
### Keywords: models

### ** Examples


## Not run: 
##D   ## data generating
##D   set.seed(1977)
##D   Q <- 3
##D   true.beta1   <-  c(1, 1, 1) ; true.beta2   <-  c(-1, -1, -1)
##D   true.sigma2 <-  c(2, 5); true.D1 <- diag(.5, Q); true.D2 <- diag(2.5, Q)
##D   N=30; T=100;
##D   NT <- N*T
##D   x1 <- runif(NT, 1, 2)
##D   x2 <- runif(NT, 1, 2)
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
##D   ## model fitting
##D   G <- 100
##D   b0  <- rep(0, K) ; B0  <- solve(diag(100, K))
##D   c0  <- 2; d0  <- 2
##D   r0  <- 5; R0  <- diag(c(1, 0.1, 0.1))
##D   subject.id <- c(rep(1:N, each=T))
##D   time.id <- c(rep(1:T, N))
##D   out1 <- HMMpanelRE(subject.id, time.id, y, X, W, m=1,
##D                      mcmc=G, burnin=G, thin=1, verbose=G,
##D                      b0=b0, B0=B0, c0=c0, d0=d0, r0=r0, R0=R0)
##D 
##D   ## latent state changes
##D   plotState(out1)
##D 
##D   ## print mcmc output
##D   summary(out1)
##D 
##D 
##D 
## End(Not run)




