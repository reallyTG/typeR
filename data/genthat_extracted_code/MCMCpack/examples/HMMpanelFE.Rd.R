library(MCMCpack)


### Name: HMMpanelFE
### Title: Markov Chain Monte Carlo for the Hidden Markov Fixed-effects
###   Model
### Aliases: HMMpanelFE
### Keywords: models

### ** Examples


## Not run: 
##D   ## data generating
##D   set.seed(1974)
##D   N <- 30
##D   T <- 80
##D   NT <- N*T
##D 
##D   ## true parameter values
##D   true.beta <- c(1, 1)
##D   true.sigma <- 3
##D   x1 <- rnorm(NT)
##D   x2 <- runif(NT, 2, 4)
##D 
##D   ## group-specific breaks
##D   break.point = rep(T/2, N); break.sigma=c(rep(1, N));
##D   break.list <- rep(1, N)
##D 
##D   X <- as.matrix(cbind(x1, x2), NT, );
##D   y <- rep(NA, NT)
##D   id  <-  rep(1:N, each=NT/N)
##D   K <-  ncol(X);
##D   true.beta <- as.matrix(true.beta, K, 1)
##D 
##D   ## compute the break probability
##D   ruler <- c(1:T)
##D   W.mat <- matrix(NA, T, N)
##D   for (i in 1:N){
##D     W.mat[, i] <- pnorm((ruler-break.point[i])/break.sigma[i])
##D   }
##D   Weight <- as.vector(W.mat)
##D 
##D   ## draw time-varying individual effects and sample y
##D   j = 1
##D   true.sigma.alpha <- 30
##D   true.alpha1 <- true.alpha2 <- rep(NA, N)
##D   for (i in 1:N){
##D     Xi <- X[j:(j+T-1), ]
##D     true.mean <- Xi  %*% true.beta
##D     weight <- Weight[j:(j+T-1)]
##D     true.alpha1[i] <- rnorm(1, 0, true.sigma.alpha)
##D     true.alpha2[i] <- -1*true.alpha1[i]
##D     y[j:(j+T-1)] <- ((1-weight)*true.mean + (1-weight)*rnorm(T, 0, true.sigma) +
##D     		    (1-weight)*true.alpha1[i]) +
##D     		    (weight*true.mean + weight*rnorm(T, 0, true.sigma) + weight*true.alpha2[i])
##D     j <- j + T
##D   }
##D 
##D   ## extract the standardized residuals from the OLS with fixed-effects
##D   FEols <- lm(y ~ X + as.factor(id) -1 )
##D   resid.all <- rstandard(FEols)
##D   time.id <- rep(1:80, N)
##D 
##D   ## model fitting
##D   G <- 100
##D   BF <- testpanelSubjectBreak(subject.id=id, time.id=time.id,
##D          resid= resid.all, max.break=3, minimum = 10,
##D          mcmc=G, burnin = G, thin=1, verbose=G,
##D          b0=0, B0=1/100, c0=2, d0=2, Time = time.id)
##D 
##D   ## get the estimated break numbers
##D   estimated.breaks <- make.breaklist(BF, threshold=3)
##D 
##D   ## model fitting
##D   out <- HMMpanelFE(subject.id = id, y, X=X, m =  estimated.breaks,
##D              mcmc=G, burnin=G, thin=1, verbose=G,
##D              b0=0, B0=1/1000, c0=2, d0=2, delta0=0, Delta0=1/1000)
##D 
##D   ## print out the slope estimate
##D   ## true values are 1 and 1
##D   summary(out)
##D 
##D   ## compare them with the result from the constant fixed-effects
##D   summary(FEols)
## End(Not run)




