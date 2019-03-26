## ----setup, include=FALSE, message=FALSE---------------------------------
knitr::opts_chunk$set(echo = TRUE,
                      fig.width = 7.5, 
                      fig.height = 5)

# Load packages
library(flexsurv)
library(rstpm2)
library(simsurv)

## ---- example1-----------------------------------------------------------
# Define a function for analysing one simulated dataset
sim_run <- function() {
  # Create a data frame with the subject IDs and treatment covariate
  cov <- data.frame(id = 1:200,
                    trt = rbinom(200, 1, 0.5))
  
  # Simulate the event times
  dat <- simsurv(lambdas = 0.1, 
                 gammas = 1.5, 
                 betas = c(trt = -0.5), 
                 x = cov, 
                 maxt = 5)
  
  # Merge the simulated event times onto covariate data frame
  dat <- merge(cov, dat)
  
  # Fit a Weibull proportional hazards model
  mod <- flexsurv::flexsurvspline(Surv(eventtime, status) ~ trt, data = dat)
  
  # Obtain estimates, standard errors and 95% CI limits
  est <- mod$coefficients[["trt"]]
  ses <- sqrt(diag(mod$cov))[["trt"]]
  cil <- est + qnorm(.025) * ses
  ciu <- est + qnorm(.975) * ses
  
  # Return bias and coverage indicator for treatment effect
  c(bias = est - (-0.5), 
    coverage = ((-0.5 > cil) && (-0.5 < ciu)))
}

# Set seed for simulations
set.seed(908070)

# Perform 100 replicates in simulation study
rowMeans(replicate(100, sim_run()))

## ---- brcancer_data------------------------------------------------------
data("brcancer")
head(brcancer)

## ---- brcancer_models----------------------------------------------------
# Fit the Weibull survival model
mod_weib <- flexsurv::flexsurvspline(Surv(rectime, censrec) ~ hormon, 
                                     data = brcancer, k = 0)

# Fit the flexible parametric survival model
mod_flex <- flexsurv::flexsurvspline(Surv(rectime, censrec) ~ hormon, 
                                     data = brcancer, k = 3)

## ---- brcancer_plots-----------------------------------------------------
par(mfrow = c(1,2), cex = 0.85) # graphics parameters
plot(mod_weib,
     main = "Weibull model",
     ylab = "Survival probability",
     xlab = "Time") 
plot(mod_flex,
     main = "Flexible parametric model",
     ylab = "Survival probability",
     xlab = "Time")

## ---- define_logcumhaz---------------------------------------------------
# Define a function returning the log cum hazard at time t
logcumhaz <- function(t, x, betas, knots) {
  
  # Obtain the basis terms for the spline-based log
  # cumulative hazard (evaluated at time t)
  basis <- flexsurv::basis(knots, log(t))
  
  # Evaluate the log cumulative hazard under the
  # Royston and Parmar specification
  res <- 
    betas[["gamma0"]] * basis[[1]] + 
    betas[["gamma1"]] * basis[[2]] +
    betas[["gamma2"]] * basis[[3]] +
    betas[["gamma3"]] * basis[[4]] +
    betas[["gamma4"]] * basis[[5]] +
    betas[["hormon"]] * x[["hormon"]]
  
  # Return the log cumulative hazard at time t
  res
}

## ---- example2-----------------------------------------------------------
# Fit the model to the brcancer dataset to obtain the "true"
# parameter values that will be used in our simulation study
true_mod <- flexsurv::flexsurvspline(Surv(rectime, censrec) ~ hormon, 
                                     data = brcancer, k = 3)

# Define a function to generate one simulated dataset, fit
# our two models (Weibull and flexible) to the simulated data
# and then return the bias in the estimated effect of hormone
# therapy under each fitted model
sim_run <- function(true_mod) {
  # Create a data frame with the subject IDs and treatment covariate
  cov <- data.frame(id = 1:200, hormon = rbinom(200, 1, 0.5))

  # Simulate the event times
  dat <- simsurv(betas = true_mod$coefficients, # "true" parameter values
                 x = cov,                   # covariate data for 200 individuals
                 knots = true_mod$knots,    # knot locations for splines
                 logcumhazard = logcumhaz,  # definition of log cum hazard
                 maxt = NULL,               # no right-censoring
                 interval = c(1E-8,100000)) # interval for root finding
  
  # Merge the simulated event times onto covariate data frame
  dat <- merge(cov, dat)

  # Fit a Weibull proportional hazards model
  weib_mod <- flexsurv::flexsurvspline(Surv(eventtime, status) ~ hormon, 
                                       data = dat, k = 0)

  # Fit a flexible parametric proportional hazards model
  flex_mod <- flexsurv::flexsurvspline(Surv(eventtime, status) ~ hormon, 
                                       data = dat, k = 3)
  
  # Obtain estimates, standard errors and 95% CI limits for hormone effect
  true_loghr <- true_mod$coefficients[["hormon"]]
  weib_loghr <- weib_mod$coefficients[["hormon"]]
  flex_loghr <- flex_mod$coefficients[["hormon"]]
 
  # Return bias and coverage indicator for hormone effect
  c(weib_bias = weib_loghr - true_loghr, 
    flex_bias = flex_loghr - true_loghr)
}

# Set a seed for the simulations
set.seed(543543)

# Perform the simulation study using 100 replicates
rowMeans(replicate(100, sim_run(true_mod = true_mod)))

## ---- tdeexample_sim-----------------------------------------------------
covs <- data.frame(id = 1:5000, trt = rbinom(5000, 1, 0.5))
simdat <- simsurv(dist = "weibull", lambdas = 0.1, gammas = 1.5, betas = c(trt = -0.5),
                  x = covs, tde = c(trt = 0.15), tdefunction = "log", maxt = 5)
simdat <- merge(simdat, covs)
head(simdat)

## ---- tdeexample_mod1----------------------------------------------------
mod_tvc <- rstpm2::stpm2(Surv(eventtime, status) ~ trt, 
                         data = simdat, tvc = list(trt = 1))

## ---- tdeexample_mod2----------------------------------------------------
mod_ph <- rstpm2::stpm2(Surv(eventtime, status) ~ trt, 
                        data = simdat)

## ---- tdeexample_plothr--------------------------------------------------
plot(mod_tvc, newdata = data.frame(trt = 0), type = "hr", 
     var = "trt", ylim = c(0,1), ci = TRUE, rug = FALSE,
     main = "Time dependent hazard ratio",
     ylab = "Hazard ratio", xlab = "Time")
plot(mod_ph,  newdata = data.frame(trt = 0), type = "hr", 
     var = "trt", ylim = c(0,1), add = TRUE, ci = FALSE, lty = 2)

## ---- jmexample_define_hazard--------------------------------------------
# First we define the hazard function to pass to simsurv
# (NB this is a Weibull proportional hazards regression submodel
# from a joint longitudinal and survival model with a "current
# value" association structure)
haz <- function(t, x, betas, ...) {
  betas[["delta"]] * (t ^ (betas[["delta"]] - 1)) * exp(
    betas[["gamma_0"]] +
    betas[["gamma_1"]] * x[["x1"]] +
    betas[["gamma_2"]] * x[["x2"]] +
    betas[["alpha"]] * (
      betas[["beta_0i"]] +
      betas[["beta_1i"]] * t +
      betas[["beta_2"]]  * x[["x1"]] +
      betas[["beta_3"]]  * x[["x2"]]
    )
  )
}

## ---- jmexample_pars_and_covs--------------------------------------------
# Then we construct data frames with the true parameter
# values and the covariate data for each individual
set.seed(5454) # set seed before simulating data
N <- 200       # number of individuals

# Population (fixed effect) parameters
betas <- data.frame(
  delta   = rep(2,    N),
  gamma_0 = rep(-11.9,N),
  gamma_1 = rep(0.6,  N),
  gamma_2 = rep(0.08, N),
  alpha   = rep(0.03, N),
  beta_0  = rep(90,   N),
  beta_1  = rep(2.5,  N),
  beta_2  = rep(-1.5, N),
  beta_3  = rep(1,    N)
)

# Individual-specific (random effect) parameters
b_corrmat <- matrix(c(1, 0.5, 0.5, 1), 2, 2)
b_sds     <- c(20, 3)
b_means   <- rep(0, 2)
b_z       <- MASS::mvrnorm(n = N, mu = b_means, Sigma = b_corrmat)
b         <- sapply(1:length(b_sds), 
                    FUN = function(x) b_sds[x] * b_z[,x])
betas$beta_0i <- betas$beta_0 + b[,1]
betas$beta_1i <- betas$beta_1 + b[,2]

# Covariate data
covdat <- data.frame(
  x1 = stats::rbinom(N, 1, 0.45), # a binary covariate
  x2 = stats::rnorm(N, 44, 8.5)   # a continuous covariate
)

## ---- jmexample_sim------------------------------------------------------
# Set seed for simulations
set.seed(546546)

# Then simulate the survival times based on the user-defined
# hazard function, covariates data, and true parameter values
times <- simsurv(hazard = haz, x = covdat, betas = betas, maxt = 10)

## ---- jmexample_view_data------------------------------------------------
head(times)
## id eventtime status
##  1  4.813339      1
##  2  9.763900      1
##  3  5.913436      1
##  4  2.823562      1
##  5  2.315488      1
##  6 10.000000      0

