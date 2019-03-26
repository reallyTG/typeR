library(calibrator)


### Name: p.eqn8.supp
### Title: A postiori probability of hyperparameters
### Aliases: p.eqn8.supp p.eqn8.supp.vector
### Keywords: array

### ** Examples

data(toys)
p.eqn8.supp(theta=theta.toy, D1=D1.toy, D2=D2.toy, H1=H1.toy, H2=H2.toy,
d=d.toy, phi=phi.toy)

## Now try using the true hyperparameters, and data directly drawn from
## the appropriate multivariate distn:

phi.true <- phi.true.toy(phi=phi.toy)
jj <- create.new.toy.datasets(D1.toy , D2.toy)
d.toy <- jj$d.toy
p.eqn8.supp(theta=theta.toy, D1=D1.toy, D2=D2.toy, H1=H1.toy,
     H2=H2.toy, d=d.toy, phi=phi.true)


## Now try p.eqn8.supp() with a vector of possible thetas:
p.eqn8.supp(theta=sample.theta(n=11,phi=phi.true), D1=D1.toy,
     D2=D2.toy, H1=H1.toy, H2=H2.toy,  d=d.toy, phi=phi.true)




