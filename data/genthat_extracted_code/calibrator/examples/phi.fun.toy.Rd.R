library(calibrator)


### Name: phi.fun.toy
### Title: Functions to create or change hyperparameters
### Aliases: phi.fun.toy phi.change
### Keywords: array

### ** Examples


phi.fun.toy(100,101,1:6,list(mean=rep(1,6),sigma=1+diag(6)),50:55,
list(mean=rep(0,4),sigma=0.1+diag(4)),
list(mean=0.1+(1:3),sigma=2.1+diag(3)))

phi.fun.toy(rho=1, lambda=1,
    psi1 = structure(c(1.1, 1.2, 1.3, 1.4, 1.5, 0.7),
            .Names = c("x", "y", "A","B", "C","s1sq")),
    psi1.apriori  = list(
             mean=rep(0,6), sigma=0.4+diag(6)),
             psi2=structure(c(2.1, 2.2), .Names = c("x","y")),
             psi2.apriori  = list(mean=rep(0,5),sigma=0.2+diag(5)),
             theta.apriori = list(mean=0.1+(1:3),sigma=2.1+diag(3))
)

data(toys)
phi.change(phi.fun=phi.fun.toy, old.phi = phi.toy, rho = 100)
phi.change(phi.fun=phi.fun.toy, old.phi = phi.toy,
     theta.apriori.sigma = 4*diag(3))

identical(phi.toy, phi.change(phi.fun=phi.fun.toy, old.phi=phi.toy))



