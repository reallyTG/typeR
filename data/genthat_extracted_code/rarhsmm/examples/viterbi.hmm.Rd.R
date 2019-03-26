library(rarhsmm)


### Name: viterbi.hmm
### Title: Viterbi algorithm to decode the latent states for Gaussian
###   hidden Markov model with / without autoregressive structures
### Aliases: viterbi.hmm

### ** Examples

set.seed(135)
m <- 2
mu <- list(c(3,4,5),c(-2,-3,-4))
sigma <- list(diag(1.3,3), 
            matrix(c(1,-0.3,0.2,-0.3,1.5,0.3,0.2,0.3,2),3,3,byrow=TRUE))
delta <- c(0.5,0.5)
gamma <- matrix(c(0.8,0.2,0.1,0.9),2,2,byrow=TRUE)
auto <- list(matrix(c(0.3,0.2,0.1,0.4,0.3,0.2,
                     -0.3,-0.2,-0.1,0.3,0.2,0.1,
                      0,0,0,0,0,0),3,6,byrow=TRUE),
            matrix(c(0.2,0,0,0.4,0,0,
                      0,0.2,0,0,0.4,0,
                     0,0,0.2,0,0,0.4),3,6,byrow=TRUE))
mod <- list(m=m,mu=mu,sigma=sigma,delta=delta,gamma=gamma,auto=auto,arp=2)
sim <- hmm.sim(2000,mod)
y <- sim$series
state <- sim$state
fit <- em.hmm(y=y, mod=mod, arp=2)
state_est <- viterbi.hmm(y=y,mod=fit)
sum(state_est!=state)



