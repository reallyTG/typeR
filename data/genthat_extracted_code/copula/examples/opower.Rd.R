library(copula)


### Name: opower
### Title: Outer Power Transformation of Archimedean Copulas
### Aliases: opower
### Keywords: distribution

### ** Examples

## Construct an outer power Clayton copula with parameter thetabase such
## that Kendall's tau equals 0.2
thetabase <- copClayton@iTau(0.2)
opC <- opower(copClayton, thetabase) # "acopula" obj. (unspecified theta)

## Construct a 3d nested Archimedean copula based on opC, that is, a nested
## outer power Clayton copula.  The parameters theta are chosen such that
## Kendall's tau equals 0.4 and 0.6 for the outer and inner sector,
## respectively.
theta0 <- opC@iTau(0.4)
theta1 <- opC@iTau(0.6)
opC3d <- onacopulaL(opC, list(theta0, 1, list(list(theta1, 2:3))))
## or opC3d <- onacopula(opC, C(theta0, 1, C(theta1, c(2,3))))

## Compute the corresponding lower and upper tail-dependence coefficients
rbind(theta0 = c(
      lambdaL = opC@lambdaL(theta0),
      lambdaU = opC@lambdaU(theta0) # => opC3d has upper tail dependence
      ),
      theta1 = c(
      lambdaL = opC@lambdaL(theta1),
      lambdaU = opC@lambdaU(theta1) # => opC3d has upper tail dependence
      ))

## Sample opC3d
n <- 1000
U <- rnacopula(n, opC3d)

## Plot the generated vectors of random variates of the nested outer
## power Clayton copula.
splom2(U)

## Construct such random variates "by hand"
## (1) draw V0 and V01
V0  <- opC@ V0(n, theta0)
V01 <- opC@V01(V0, theta0, theta1)
## (2) build U
U <- cbind(
opC@psi(rexp(n)/V0,  theta0),
opC@psi(rexp(n)/V01, theta1),
opC@psi(rexp(n)/V01, theta1))



