## ---- echo = TRUE, eval = TRUE-------------------------------------------
inverse.gaussian()$dev.resids
inverse.gaussian()$variance
inverse.gaussian()$aic

## ---- echo = TRUE, eval = TRUE-------------------------------------------
dens <- function(y, m = 1, mu, phi, family) {
    object <- enrich(family)
    with(object, {
        c2 <- if (family == "binomial") c2fun(y, m) else c2fun(y)
        exp(m * (y * theta(mu) - bfun(theta(mu)) - c1fun(y))/phi -
            0.5 * afun(-m/phi) + c2)
    })
}

## ---- echo = TRUE, eval = TRUE-------------------------------------------
## Normal
all.equal(dens(y = 0.2, m = 3, mu = 1, phi = 3.22, gaussian()),
          dnorm(x = 0.2, mean = 1, sd = sqrt(3.22/3)))

## Gamma
all.equal(dens(y = 3, m = 1.44, mu = 2.3, phi = 1.3, Gamma()),
          dgamma(x = 3, shape = 1.44/1.3, 1.44/(1.3 * 2.3)))

## Inverse gaussian
all.equal(dens(y = 0.2, m = 7.23, mu = 1, phi = 3.22, inverse.gaussian()),
          SuppDists::dinvGauss(0.2, nu = 1, lambda = 7.23/3.22))

## Binomial
all.equal(dens(y = 0.34, m = 100, mu = 0.32, phi = 1, binomial()),
          dbinom(x = 34, size = 100, prob = 0.32))


