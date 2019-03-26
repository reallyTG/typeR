library(GFORCE)


### Name: gforce.FORCE
### Title: FORCE K-means solver.
### Aliases: gforce.FORCE

### ** Examples

K <- 5
n <- 50
d <- 50
dat <- gforce.generator(K,d,n,3,graph='scalefree')
sig_hat <- (1/n)*t(dat$X)%*%dat$X
gam_hat <- gforce.Gamma(dat$X)
D <- diag(gam_hat) - sig_hat
res <- gforce.FORCE(D,K)




