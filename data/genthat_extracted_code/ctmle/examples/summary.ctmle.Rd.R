library(ctmle)


### Name: summary.ctmle
### Title: Summarise a ctmle object
### Aliases: summary.ctmle

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
##D ctmle_summary = summary(ctmle_discrete_fit1)
##D ctmle_summary
##D ctmle_discrete_fit1
## End(Not run)



