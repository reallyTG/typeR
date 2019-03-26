library(simsurv)


### Name: simsurv
### Title: Simulate survival data
### Aliases: simsurv

### ** Examples

  #-------------- Simpler examples

  # Generate times from a Weibull model including a binary
  # treatment variable, with log(hazard ratio) = -0.5, and censoring
  # after 5 years:
  set.seed(9911)
  covs <- data.frame(id = 1:100, trt = stats::rbinom(100, 1L, 0.5))
  s1 <- simsurv(lambdas = 0.1, gammas = 1.5, betas = c(trt = -0.5),
                x = covs, maxt = 5)
  head(s1)

  # Generate times from a Gompertz model:
  s2 <- simsurv(dist = "gompertz", lambdas = 0.1, gammas = 0.05, x = covs)

  # Generate times from a 2-component mixture Weibull model:
  s3 <- simsurv(lambdas = c(0.1, 0.05), gammas = c(1, 1.5),
                mixture = TRUE, pmix = 0.5, x = covs, maxt = 5)

  # Generate times from user-defined log hazard function:
  fn <- function(t, x, betas, ...)
    (-1 + 0.02 * t - 0.03 * t ^ 2 + 0.005 * t ^ 3)
  s4 <- simsurv(loghazard = fn, x = covs, maxt = 1.5)

  # Generate times from a Weibull model with diminishing treatment effect:
  s5 <- simsurv(lambdas = 0.1, gammas = 1.5, betas = c(trt = -0.5),
                x = covs, tde = c(trt = 0.05), tdefunction = "log")

  #-------------- Complex examples

  # Here we present an example of simulating survival times
  # based on a joint longitudinal and survival model

  # First we define the hazard function to pass to simsurv
  # (NB this is a Weibull proportional hazards regression submodel
  # from a joint longitudinal and survival model with a "current
  # value" association structure).
  haz <- function(t, x, betas, ...) {
      betas[["shape"]] * (t ^ (betas[["shape"]] - 1)) * exp(
        betas[["betaEvent_intercept"]] +
        betas[["betaEvent_binary"]] * x[["Z1"]] +
        betas[["betaEvent_continuous"]] * x[["Z2"]] +
        betas[["betaEvent_assoc"]] * (
          betas[["betaLong_intercept"]] +
          betas[["betaLong_slope"]] * t +
          betas[["betaLong_binary"]] * x[["Z1"]] +
          betas[["betaLong_continuous"]] * x[["Z2"]]
        )
      )
  }

  # Then we construct data frames with the true parameter
  # values and the covariate data for each individual
  set.seed(5454) # set seed before simulating data
  N <- 20        # number of individuals

  # Population (fixed effect) parameters
  betas <- data.frame(
    shape                = rep(2,    N),
    betaEvent_intercept  = rep(-11.9,N),
    betaEvent_binary     = rep(0.6,  N),
    betaEvent_continuous = rep(0.08, N),
    betaEvent_assoc      = rep(0.03, N),
    betaLong_binary      = rep(-1.5, N),
    betaLong_continuous  = rep(1,    N),
    betaLong_intercept   = rep(90,   N),
    betaLong_slope       = rep(2.5,  N)
  )

  # Individual-specific (random effect) parameters
  b_corrmat <- matrix(c(1, 0.5, 0.5, 1), 2, 2)
  b_sds     <- c(20, 3)
  b_means   <- rep(0, 2)
  b_z       <- MASS::mvrnorm(n = N, mu = b_means, Sigma = b_corrmat)
  b         <- sapply(1:length(b_sds), function(x) b_sds[x] * b_z[,x])
  betas$betaLong_intercept <- betas$betaLong_intercept + b[,1]
  betas$betaLong_slope     <- betas$betaLong_slope     + b[,2]

  # Covariate data
  covdat <- data.frame(
    Z1 = stats::rbinom(N, 1, 0.45), # a binary covariate
    Z2 = stats::rnorm(N, 44, 8.5)   # a continuous covariate
  )

  # Then we simulate the survival times based on the
  # hazard function, covariates, and true parameter values
  times <- simsurv(hazard = haz, x = covdat, betas = betas, maxt = 10)
  head(times)




