library(GFORCE)


### Name: gforce.certify_adapt
### Title: FORCE optimality certificate (K is unknown).
### Aliases: gforce.certify_adapt

### ** Examples

K <- 5
n <- 50 
d <- 50
dat <- gforce.generator(K,d,n,3,graph='scalefree')
sig_hat <- (1/n)*t(dat$X)%*%dat$X
gam_hat <- gforce.Gamma(dat$X)
D <- diag(gam_hat) - sig_hat
dual_cert <- gforce.certify_adapt(dat$group_assignments,D)




