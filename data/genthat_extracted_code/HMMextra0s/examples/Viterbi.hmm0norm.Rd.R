library(HMMextra0s)


### Name: Viterbi.hmm0norm
### Title: Viterbi Path of a 1-D HMM with Extra Zeros
### Aliases: Viterbi.hmm0norm
### Keywords: inversion

### ** Examples

pie <- c(0.002,0.2,0.4)
gamma <- matrix(c(0.99,0.007,0.003,
                  0.02,0.97,0.01,
                  0.04,0.01,0.95),byrow=TRUE, nrow=3)
mu <- matrix(c(0.3,0.7,0.2),nrow=1)
sig <- matrix(c(0.2,0.1,0.1),nrow=1)
delta <- c(1,0,0)
y <- sim.hmm0norm(mu,sig,pie,gamma,delta, nsim=5000)
R <- as.matrix(y$x,ncol=1)
Z <- y$z
HMMEST <- hmm0norm(R, Z, pie, gamma, mu, sig, delta)
Viterbi3 <- Viterbi.hmm0norm(R,Z,HMMEST)



