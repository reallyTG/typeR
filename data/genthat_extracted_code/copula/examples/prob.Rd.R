library(copula)


### Name: prob
### Title: Computing Probabilities of Hypercubes
### Aliases: prob prob-methods prob,Copula-method
### Keywords: distribution methods

### ** Examples

## Construct a three-dimensional nested Joe copula with parameters
## chosen such that the Kendall's tau of the respective bivariate margins
## are 0.2 and 0.5.
theta0 <- copJoe@iTau(.2)
theta1 <- copJoe@iTau(.5)
C3 <- onacopula("J", C(theta0, 1, C(theta1, c(2,3))))

## Compute the probability of a random vector distributed according to
## this copula to fall inside the cube with lower point l and upper
## point u.
l <- c(.7,.8,.6)
u <- c(1,1,1)
prob(C3, l, u)

## ditto for a bivariate normal copula with rho = 0.8 :
prob(normalCopula(0.8), c(.2,.4), c(.3,.6))



