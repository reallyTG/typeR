library(rarhsmm)


### Name: hmm.predict
### Title: 1-step forward prediction for (autoregressive) Gaussian hidden
###   Markov model
### Aliases: hmm.predict

### ** Examples

set.seed(15562)
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
fit <- em.hmm(y=y, mod=mod, arp=2, tol=1e-5)
forecast <- hmm.predict(y=y,mod=fit)




