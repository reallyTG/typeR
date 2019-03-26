library(rarhsmm)


### Name: hsmm.predict
### Title: 1-step forward prediction for (autoregressive) Gaussian hidden
###   semi-Markov model
### Aliases: hsmm.predict

### ** Examples

set.seed(15562)
m <- 2
mu <- list(c(3,4,5),c(-2,-3,-4))
sigma <- list(diag(1.3,3), 
            matrix(c(1,-0.3,0.2,-0.3,1.5,0.3,0.2,0.3,2),3,3,byrow=TRUE))
delta <- c(0.5,0.5)
gamma <- matrix(c(0,1,1,0),2,2,byrow=TRUE)
d <- list(c(0.4,0.2,0.1,0.1,0.1,0.1),c(0.5,0.3,0.2))
auto <- list(matrix(c(0.3,0.2,0.1,0.4,0.3,0.2,
                     -0.3,-0.2,-0.1,0.3,0.2,0.1,
                      0,0,0,0,0,0),3,6,byrow=TRUE),
            matrix(c(0.2,0,0,0.4,0,0,
                      0,0.2,0,0,0.4,0,
                     0,0,0.2,0,0,0.4),3,6,byrow=TRUE))
mod <- list(m=m,mu=mu,sigma=sigma,delta=delta,gamma=gamma,
            auto=auto,arp=2,d=d)
sim <- hsmm.sim(2000,mod)
y <- sim$series
state <- sim$state
fit <- em.semi(y=y, mod=mod, arp=2,tol=1e-5)
forecast <- hsmm.predict(y=y,mod=fit)




