library(blme)


### Name: blme
### Title: Fit Bayesian Linear and Generalized Linear Mixed-Effects Models
### Aliases: blmer bglmer
### Keywords: models methods

### ** Examples

##  covariance prior
data("sleepstudy", package = "lme4")
(fm1 <- blmer(Reaction ~ Days + (0 + Days|Subject), sleepstudy,
              cov.prior = gamma))
(fm2 <- blmer(Reaction ~ Days + (0 + Days|Subject), sleepstudy,
              cov.prior = gamma(shape = 2, rate = 0.5, posterior.scale = 'sd')))
(fm3 <- blmer(Reaction ~ Days + (1 + Days|Subject), sleepstudy,
              cov.prior = wishart))
(fm4 <- blmer(Reaction ~ Days + (1 + Days|Subject), sleepstudy,
              cov.prior = invwishart(df = 5, scale = diag(0.5, 2))))

##  custom prior
penaltyFn <- function(sigma)
  dcauchy(sigma, 0, 10, log = TRUE)
(fm5 <- blmer(Reaction ~ Days + (0 + Days|Subject), sleepstudy,
              cov.prior = custom(penaltyFn, chol = TRUE, scale = "log")))


##  fixed effect prior
(fm6 <- blmer(Reaction ~ Days + (1 + Days|Subject), sleepstudy,
              cov.prior = NULL,
              fixef.prior = normal))
(fm7 <- blmer(Reaction ~ Days + (1 + Days|Subject), sleepstudy,
              cov.prior = NULL,
              fixef.prior = normal(cov = diag(0.5, 2), common.scale = FALSE)))

##  residual variance prior
##  eight schools example
y <- c(28, 8, -3, 7, -1, 1, 18, 12);
sigma <- c(15, 10, 16, 11, 9, 11, 10, 18);
g <- 1:8;
  
(schools <- blmer(y ~ 1 + (1 | g), resid.prior = point,
                  cov.prior = NULL, REML = FALSE,
                  weights = 1 / sigma^2));



