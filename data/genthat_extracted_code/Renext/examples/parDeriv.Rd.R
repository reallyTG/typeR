library(Renext)


### Name: parDeriv
### Title: Derivation of probability functions with respect to the
###   parameters
### Aliases: parDeriv

### ** Examples

set.seed(1234)
distname <- "maxlo"
if (distname == "weibull") {
    logL <- function(par) {
        sum(dweibull(x, shape = par["shape"], scale = par["scale"], log = TRUE))
    }
    sumS <- function(par) {
        sum(pweibull(x, shape = par["shape"], scale = par["scale"],
                     lower.tail = FALSE))
    }
    pars <- c("shape" = rexp(1), "scale" = 1000 * rexp(1))
    x <- rweibull(n = 100, shape = pars["shape"], scale = pars["scale"])
    Der <- parDeriv(par = pars, x = x, distname = "weibull") 
} else if (distname == "gpd") {
    require(evd)
    logL <- function(par) {
        sum(dgpd(x, loc = 0, shape = par["shape"], scale = par["scale"],
                 log = TRUE))
    }
    sumS <- function(par) { 
        sum(pgpd(x, loc = 0, shape = par["shape"], scale = par["scale"],
                 lower.tail = FALSE))
    }
    pars <- c("scale" = 1000 * rexp(1),
              "shape" = runif(1, min = -0.4, max = 0.4))
    x <- rgpd(n = 100, loc = 0, shape = pars["shape"], scale = pars["scale"])
    Der <- parDeriv(par = pars, x = x, distname = "gpd")
} else if (distname == "lomax") {
    logL <- function(par) {
        sum(dlomax(x, shape = par["shape"], scale = par["scale"], log = TRUE))
    }
    sumS <- function(par) { 
        sum(plomax(x, shape = par["shape"], scale = par["scale"],
                   lower.tail = FALSE))
    }
    pars <- c( "shape" = 1 + rexp(1), "scale" = 1000 * rexp(1))
    x <- rlomax(n = 100, shape = pars["shape"], scale = pars["scale"])
    Der <- parDeriv(par = pars, x = x, distname = "lomax") 
} else if (distname == "maxlo") {
    logL <- function(par) {
        sum(dmaxlo(x, shape = par["shape"], scale = par["scale"], log = TRUE))
    }
    sumS <- function(par) { 
        sum(pmaxlo(x, shape = par["shape"], scale = par["scale"],
                   lower.tail = FALSE))
    }
    pars <- c( "shape" = 2.5 + runif(1), "scale" = 100 * rexp(1))
    x <- rmaxlo(n = 100, shape = pars["shape"], scale = pars["scale"])
    Der <- parDeriv(par = pars, x = x, distname = "maxlo") 
}

## check logdens
H <- numDeriv::hessian(func = logL, x = pars)
colnames(H) <- names(pars)
Grad <- numDeriv::grad(func = logL, x = pars)

cat("gradient for log density\n")
print(cbind(parDeriv = Der$derLogdens, num = Grad))

cat("hessian for log density\n")
print(cbind(exact = Der$der2Logdens, num = H))

## check survival
HS <- numDeriv::hessian(func = sumS, x = pars)
HS <- (HS + t(HS))/2
colnames(HS) <- names(pars)
GradS <- numDeriv::grad(func = sumS, x = pars)

cat("gradient for Survival\n")
print(cbind(parDeriv = Der$derSurv, num = GradS))

cat("hessian for Survival\n")
print(cbind(exact = Der$der2Surv, num = HS))



