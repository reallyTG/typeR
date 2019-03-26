library(EAinference)


### Name: hdIS
### Title: Compute importance weights for lasso, group lasso, scaled lasso
###   or scaled group lasso estimator under high-dimensional setting
### Aliases: hdIS

### ** Examples

set.seed(1234)
n <- 10
p <- 30
Niter <-  10
Group <- rep(1:(p/10), each = 10)
Weights <- rep(1, p/10)
x <- matrix(rnorm(n*p), n)

# Target distribution parameter
PETarget <- rep(0, p)
sig2Target <- .5
lbdTarget <- .37

#
# Using non-mixture distribution
# ------------------------------
## Proposal distribution parameter
PEProp1 <- rep(1, p)
sig2Prop1 <- .5
lbdProp1 <- 1
PB <- PBsampler(X = x, PE_1 = PEProp1, sig2_1 = sig2Prop1,
 lbd_1 = lbdProp1, weights = Weights, group = Group, niter = Niter,
 type="grlasso", PEtype = "coeff")

hdIS(PB, PETarget = PETarget, sig2Target = sig2Target, lbdTarget = lbdTarget,
 log = TRUE)

#
# Using mixture distribution
# ------------------------------
# Target distribution parameters (coeff, sig2, lbd) = (rep(0,p), .5, .37)
# Proposal distribution parameters
#  (coeff, sig2, lbd) = (rep(0,p), .5, .37) & (rep(1,p), 1, .5)
#
#
PEProp1 <- rep(0,p); PEProp2 <- rep(1,p)
sig2Prop1 <- .5; sig2Prop2 <- 1
lbdProp1 <- .37; lbdProp2 <- .5

PBMixture <- PBsampler(X = x, PE_1 = PEProp1,
 sig2_1 = sig2Prop1, lbd_1 = lbdProp1, PE_2 = PEProp2,
 sig2_2 = sig2Prop2, lbd_2 = lbdProp2, weights = Weights, group = Group,
 niter = Niter, type = "grlasso", PEtype = "coeff")
hdIS(PBMixture, PETarget = PETarget, sig2Target = sig2Target, lbdTarget = lbdTarget,
 log = TRUE)



