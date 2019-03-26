library(ctmle)


### Name: ctmleDiscrete
### Title: Discrete Collaborative Targeted Minimum-loss based Estimation
### Aliases: ctmleDiscrete

### ** Examples

## Not run: 
##D N <- 1000
##D p = 10
##D Wmat <- matrix(rnorm(N * p), ncol = p)
##D beta1 <- 4+2*Wmat[,1]+2*Wmat[,2]+2*Wmat[,5]+2*Wmat[,6]+2*Wmat[,8]
##D beta0 <- 2+2*Wmat[,1]+2*Wmat[,2]+2*Wmat[,5]+2*Wmat[,6]+2*Wmat[,8]
##D tauW <- 2
##D tau <- 2
##D gcoef <- matrix(c(-1,-1,rep(-(3/((p)-2)),(p)-2)),ncol=1)
##D Wm <- as.matrix(Wmat)
##D g <- 1/(1+exp(Wm%*%gcoef))
##D A <- rbinom(N, 1, prob = g)
##D sigma <- 1
##D epsilon <-rnorm(N,0,sigma)
##D Y  <- beta0 + tauW*A + epsilon
##D 
##D # Initial estimate of Q
##D Q <- cbind(rep(mean(Y[A == 0]), N), rep(mean(Y[A == 1]), N))
##D 
##D # User-suplied initial estimate
##D time_greedy <- system.time(
##D ctmle_discrete_fit1 <- ctmleDiscrete(Y = Y, A = A, W = data.frame(Wmat), Q = Q,
##D                                     preOrder = FALSE)
##D )
##D 
##D # If there is no input Q, then intial Q would be estimated by SL with Sl.library
##D ctmle_discrete_fit2 <- ctmleDiscrete(Y = Y, A = A, W = data.frame(Wmat),
##D                                     preOrder = FALSE, detailed = TRUE)
##D 
##D # scalable C-TMLE with pre-order option; order is user-specified,
##D # If 'order' is  not specified takes order from W1 to Wp.
##D time_preorder <- system.time(
##D ctmle_discrete_fit3 <- ctmleDiscrete(Y = Y, A = A, W = data.frame(Wmat), Q = Q,
##D                                     preOrder = TRUE,
##D                                     order = rev(1:p), detailed = TRUE)
##D )
##D 
##D # Compare the running time
##D time_greedy
##D time_preorder
## End(Not run)



