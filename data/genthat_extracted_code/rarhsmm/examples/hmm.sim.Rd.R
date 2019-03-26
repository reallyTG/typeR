library(rarhsmm)


### Name: hmm.sim
### Title: Simulate a Gaussian hidden Markov series with / without
###   autoregressive structures
### Aliases: hmm.sim

### ** Examples

set.seed(135)
#Gaussian HMM 3 hidden states (no autoregressive structure)
m <- 3
mu <- list(c(3),c(-2),c(0))
sigma <- list(as.matrix(1), as.matrix(0.8),as.matrix(0.3))
delta <- c(0.3,0.3,0.4)
gamma <- matrix(c(0.8,0.1,0.1,0.1,0.8,0.1,0.1,0.1,0.8),3,3,byrow=TRUE)
mod1 <- list(m=m,mu=mu,sigma=sigma,delta=delta,gamma=gamma)
sim1 <- hmm.sim(1000,mod1)
y1 <- sim1$series
fit1 <- em.hmm(y=y1, mod=mod1)

#AR(2) Gaussian HMM with 3 hidden states
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
mod2 <- list(m=m,mu=mu,sigma=sigma,delta=delta,gamma=gamma,auto=auto,arp=2)
sim2 <- hmm.sim(2000,mod2)
y2 <- sim2$series
fit2 <- em.hmm(y=y2, mod=mod2, arp=2)



