library(copula)


### Name: estim.misc
### Title: Various Estimators for (Nested) Archimedean Copulas
### Aliases: ebeta edmle etau
### Keywords: models

### ** Examples

tau <- 0.25
(theta <- copGumbel@iTau(tau)) # 4/3 = 1.333..
d <- 20
(cop <- onacopulaL("Gumbel", list(theta,1:d)))

set.seed(1)
n <- 200
U <- rnacopula(n, cop)

system.time(theta.hat.beta <- ebeta(U, cop=cop))
theta.hat.beta$root

system.time(theta.hat.dmle <- edmle(U, cop=cop))
theta.hat.dmle$minimum

system.time(theta.hat.etau <- etau(U, cop=cop, method="tau.mean"))
theta.hat.etau

system.time(theta.hat.etau. <- etau(U, cop=cop, method="theta.mean"))
theta.hat.etau.

## etau()  in the case of missing values (NA's)
## ------                 ---------------------
##' @title add Missing Values completely at random
##' @param x  matrix or vector
##' @param prob desired probability ("fraction") of missing values (\code{NA}s).
##' @return x[] with some (100*prob percent) entries replaced by \code{NA}s.
addNAs <- function(x, prob) {
    np <- length(x)
    x[sample.int(np, prob*np)] <- NA
    x
}

## UM[] := U[] with 5% missing values
set.seed(7); UM <- addNAs(U, p = 0.05)
mean(is.na(UM)) # 0.05
## This error if x has NA's was happening for  etau(UM, cop=cop)
## before copula version 0.999-17 (June 2017) :
try(eM <- etau(UM, cop=cop, use = "everything"))
        #  --> Error ... NA/NaN/Inf in foreign function call
## The new default:
eM0 <- etau(UM, cop=cop, use = "pairwise")
eM1 <- etau(UM, cop=cop, use = "complete")
##  use = "complete" is really equivalent to dropping all obs. with with missing values:
stopifnot(all.equal(eM1, etau(na.omit(UM), cop=cop), tol = 1e-15))
## but  use = "pairwise" ---> cor(*, use = "pairwise") is much better:
rbind(etau.U = theta.hat.etau, etau.UM.pairwise = eM0, etau.UM.complete = eM1)



