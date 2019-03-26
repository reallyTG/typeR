library(rarhsmm)


### Name: hsmm.sim
### Title: Simulate a Gaussian hidden semi-Markov series with / without
###   autoregressive structures
### Aliases: hsmm.sim

### ** Examples

set.seed(351)
#Gaussian HSMM 3 hidden states (no autoregressive structure)
m <- 3
mu <- list(c(3),c(-2),c(0))
sigma <- list(as.matrix(1), as.matrix(0.8),as.matrix(0.3))
delta <- c(0.3,0.3,0.4)
gamma <- matrix(c(0,0.5,0.5,0.5,0,0.5,0.5,0.5,0),3,3,byrow=TRUE)
d <- list(c(0.4,0.3,0.2,0.1), c(0.5,0.25,0.25), c(0.7,0.3))
mod1 <- list(m=m,mu=mu,sigma=sigma,delta=delta,gamma=gamma,d=d)
sim1 <- hsmm.sim(500,mod1)
y1 <- sim1$series
fit1 <- em.semi(y=y1, mod=mod1)

## Not run: 
##D #AR(2) Gaussian HSMM with 3 hidden states
##D m <- 2
##D mu <- list(c(3,4,5),c(-2,-3,-4))
##D sigma <- list(diag(1.3,3), 
##D             matrix(c(1,-0.3,0.2,-0.3,1.5,0.3,0.2,0.3,2),3,3,byrow=TRUE))
##D delta <- c(0.5,0.5)
##D gamma <- matrix(c(0,1,1,0),2,2,byrow=TRUE)
##D d <- list(c(0.4,0.2,0.1,0.1,0.1,0.1),c(0.5,0.3,0.2))
##D auto <- list(matrix(c(0.3,0.2,0.1,0.4,0.3,0.2,
##D                      -0.3,-0.2,-0.1,0.3,0.2,0.1,
##D                       0,0,0,0,0,0),3,6,byrow=TRUE),
##D             matrix(c(0.2,0,0,0.4,0,0,
##D                       0,0.2,0,0,0.4,0,
##D                      0,0,0.2,0,0,0.4),3,6,byrow=TRUE))
##D mod2 <- list(m=m,mu=mu,sigma=sigma,delta=delta,gamma=gamma,
##D             auto=auto,arp=2,d=d)
##D sim2 <- hsmm.sim(2000,mod2)
##D y2 <- sim2$series
##D fit2 <- em.semi(y=y2, mod=mod2, arp=2)
## End(Not run)



