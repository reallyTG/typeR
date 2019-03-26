library(bamlss)


### Name: family.bamlss
### Title: Distribution Families in 'bamlss'
### Aliases: family.bamlss family.bamlss.frame bamlss.family beta_bamlss
###   binomial_bamlss cnorm_bamlss cox_bamlss gaussian_bamlss
###   gaussian2_bamlss Gaussian_bamlss gamma_bamlss multinomial_bamlss
###   mvnorm_bamlss mvnormAR1_bamlss poisson_bamlss gpareto_bamlss
###   glogis_bamlss
### Keywords: regression models distribution

### ** Examples

## New family object for the normal distribution,
## can be used by function bfit() and GMCMC().
normal_bamlss <- function(...) {
  f <- list(
    "family" = "normal",
    "names" = c("mu", "sigma"),
    "links" = c("identity", "log"),
    "d" = function(y, par, log = FALSE) {
      dnorm(y, mean = par$mu, sd = par$sigma, log = log)
    },
    "score" = list(
      "mu" = function(y, par, ...) {
        drop((y - par$mu) / (par$sigma^2))
      },
      "sigma" = function(y, par, ...) {
        drop(-1 + (y - par$mu)^2 / (par$sigma^2))
      }
    ),
    "hess" = list(
      "mu" = function(y, par, ...) {
        drop(1 / (par$sigma^2))
      },
      "sigma" = function(y, par, ...) { 
        rep(2, length(y))
      }
    )
  )
  class(f) <- "family.bamlss"
  return(f)
}

## Not run: 
##D ## Test on simulated data.
##D d <- GAMart()
##D b <- bamlss(num ~ s(x1) + s(x2) + s(x3),
##D   data = d, family = "normal")
##D plot(b)
##D 
##D ## Compute the log-likelihood using the family object.
##D f <- family(b)
##D sum(f$d(y = d$num, par = f$map2par(fitted(b)), log = TRUE))
##D 
##D ## For using JAGS() more details are needed.
##D norm4JAGS_bamlss <- function(...) {
##D   f <- normal_bamlss()
##D   f$bugs <- list(
##D     "dist" = "dnorm",
##D     "eta" = BUGSeta,
##D     "model" = BUGSmodel,
##D     "reparam" = c(sigma = "1 / sqrt(sigma)")
##D   )
##D   return(f)
##D }
##D 
##D ## Now with bfit() and JAGS().
##D b <- bamlss(num ~ s(x1) + s(x2) + s(x3), data = d,
##D   optimizer = bfit, sampler = JAGS, family = "norm4JAGS")
##D plot(b)
## End(Not run)



