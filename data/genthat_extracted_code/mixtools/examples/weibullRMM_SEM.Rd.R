library(mixtools)


### Name: weibullRMM_SEM
### Title: St-EM algorithm for Reliability Mixture Models (RMM) of Weibull
###   with right Censoring
### Aliases: weibullRMM_SEM
### Keywords: file

### ** Examples

n = 500 # sample size
m = 2 # nb components
lambda=c(0.4, 0.6)
shape <- c(0.5,5); scale <- c(1,20) # model parameters
set.seed(321)
x <- rweibullmix(n, lambda, shape, scale) # iid ~ weibull mixture
cs=runif(n,0,max(x)+10) # iid censoring times
t <- apply(cbind(x,cs),1,min) # censored observations
d <- 1*(x <= cs)              # censoring indicator

## set arbitrary or "reasonable" (e.g., data-driven) initial values
l0 <- rep(1/m,m); sh0 <- c(1, 2); sc0 <- c(2,10)
# Stochastic EM algorithm 
a <- weibullRMM_SEM(t, d, lambda = l0, shape = sh0, scale = sc0, maxit = 200)

summary(a) # Parameters estimates etc
plotweibullRMM(a) # plot of St-EM sequences
plot(a, which=2) # or equivalently, S3 method for "mixEM" object



