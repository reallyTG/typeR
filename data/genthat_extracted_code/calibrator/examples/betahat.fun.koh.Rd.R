library(calibrator)


### Name: betahat.fun.koh
### Title: Expectation of beta, given theta, phi and d
### Aliases: betahat.fun.koh betahat.fun.koh.vector
### Keywords: array

### ** Examples

data(toys)
betahat.fun.koh(theta=theta.toy, d=d.toy, D1=D1.toy, D2=D2.toy,
      H1=H1.toy, H2=H2.toy, phi=phi.toy)

betahat.fun.koh.vector(theta=theta.toy, d=d.toy, D1=D1.toy,
      D2=D2.toy, H1=H1.toy, H2=H2.toy, phi=phi.toy)
## should be identical

jj.theta <- rbind(theta.toy,theta.toy+1,theta.toy+2,theta.toy*0)
betahat.fun.koh(theta=jj.theta, d=d.toy, D1=D1.toy, D2=D2.toy,
     H1=H1.toy, H2=H2.toy, phi=phi.toy)

## Now try with true hyperparameters:
phi.true <- phi.true.toy(phi=phi.toy)

## And magically create the REAL parameters:
theta.REAL <- create.new.toy.datasets(export=TRUE)$REAL.PARAMS
jj.theta <- rbind(jj.theta, theta.REAL)

## Generate some data:
jj <- create.new.toy.datasets(D1.toy , D2.toy)
d.toy <- jj$d.toy


## And finally, observe that the estimated values for beta are pretty
## close to the real values (which omniscient beings can extract using
## reality() and computer.model()):

betahat.fun.koh(theta=jj.theta, d=d.toy, D1=D1.toy, D2=D2.toy,
       H1=H1.toy, H2=H2.toy, phi=phi.true)

## [
##  that is, compare the last column of the above with
##  c(computer.model(ex=T)$REAL.COEFFS, reality(ex=T)$REAL.BETA2)
## ]





