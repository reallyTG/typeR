library(EQL)


### Name: varianceFamily
### Title: Variance Family Class For The EQL-Method
### Aliases: varianceFamily powerVarianceFamily extBinomialVarianceFamily

### ** Examples

# The extended binomial variance family
# (the deviance is determined numerically)

# init does not depend on k and l but it must accept
# these parameters anyways
init <- function(k, l) {
  return(expression({
    mustart <- (weights * y + 0.5)/(weights + 1)
    n <- rep.int(1, nobs)}))
}
validmuf <- function(mu, k, l) {
  return(all(mu > 0) && all(mu < 1))
}
varf <- function(y, k, l)  y^k*(1-y)^l
suppressWarnings(vf <- varianceFamily(varf=varf, link="log", initf=init, 
                        validmuf=validmuf,
                        name="Extended-Binomial-Family"))
vf$family(1,1) # corresponds to binomial()

y <- runif(10, 0, 1)
mu <- runif(10, 0, 1)

all.equal(vf$family(1,1)$dev.resids(y,mu,1),     # TRUE
          binomial()$dev.resids(y,mu,1))    




