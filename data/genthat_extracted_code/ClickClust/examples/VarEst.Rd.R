library(ClickClust)


### Name: click.var
### Title: Variance-covariance matrix estimation
### Aliases: click.var
### Keywords: variance estimation EM algorithm Markov model

### ** Examples


set.seed(123)

n.seq <- 200

p <- 5
K <- 2
mix.prop <- c(0.3, 0.7)


TP1 <- matrix(c(0.20, 0.10, 0.15, 0.15, 0.40,
                0.20, 0.20, 0.20, 0.20, 0.20,
                0.15, 0.10, 0.20, 0.20, 0.35,
                0.15, 0.10, 0.20, 0.20, 0.35,
                0.30, 0.30, 0.10, 0.10, 0.20), byrow = TRUE, ncol = p)

TP2 <- matrix(c(0.15, 0.15, 0.20, 0.20, 0.30,
                0.20, 0.10, 0.30, 0.30, 0.10,
                0.25, 0.20, 0.15, 0.15, 0.25,
                0.25, 0.20, 0.15, 0.15, 0.25,
                0.10, 0.30, 0.20, 0.20, 0.20), byrow = TRUE, ncol = p)


TP <- array(rep(NA, p * p * K), c(p, p, K))
TP[,,1] <- TP1
TP[,,2] <- TP2


# DATA SIMULATION

A <- click.sim(n = n.seq, int = c(10, 50), alpha = mix.prop, gamma = TP)
C <- click.read(A$S)


# EM ALGORITHM

M2 <- click.EM(X = C$X, y = C$y, K = 2)


# VARIANCE ESTIMATION

V <- click.var(X = C$X, y = C$y, alpha = M2$alpha, beta = M2$beta,
               gamma = M2$gamma, z = M2$z)

# 95% confidence intervals for all model parameters

Estimate <- c(M2$alpha[-K], as.vector(t(M2$beta[,-p])),
              as.vector(apply(M2$gamma[,-p,], 3, t)))

Lower <- Estimate - qnorm(0.975) * sqrt(diag(V))
Upper <- Estimate + qnorm(0.975) * sqrt(diag(V))

cbind(Estimate, Lower, Upper)




