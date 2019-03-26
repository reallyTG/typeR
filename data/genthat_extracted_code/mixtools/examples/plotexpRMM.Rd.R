library(mixtools)


### Name: plotexpRMM
### Title: Plot sequences from the EM algorithm for censored mixture of
###   exponentials
### Aliases: plotexpRMM
### Keywords: file

### ** Examples

n=300 # sample size
m=2   # number of mixture components
lambda <- c(1/3,1-1/3); rate <- c(1,1/10) # mixture parameters
set.seed(1234)
x <- rexpmix(n, lambda, rate) # iid ~ exponential mixture
cs=runif(n,0,max(x)) # Censoring (uniform) and incomplete data
t <- apply(cbind(x,cs),1,min) # observed or censored data
d <- 1*(x <= cs)              # censoring indicator

###### EM for RMM, exponential lifetimes
l0 <- rep(1/m,m); r0 <- c(1, 0.5) # "arbitrary" initial values
a <- expRMM_EM(t, d, lambda=l0, rate=r0, k = m)
summary(a)             # EM estimates etc
plotexpRMM(a, lwd=2) # plot of EM sequences



