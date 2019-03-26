## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)
library("GLMMadaptive")

## ------------------------------------------------------------------------
set.seed(1234)
n <- 100 # number of subjects
K <- 8 # number of measurements per subject
t_max <- 15 # maximum follow-up time

# we constuct a data frame with the design: 
# everyone has a baseline measurment, and then measurements at random follow-up times
DF <- data.frame(id = rep(seq_len(n), each = K),
                 time = c(replicate(n, c(0, sort(runif(K - 1, 0, t_max))))),
                 sex = rep(gl(2, n/2, labels = c("male", "female")), each = K))

# design matrices for the fixed and random effects
X <- model.matrix(~ sex * time, data = DF)
Z <- model.matrix(~ time, data = DF)

betas <- c(-2.13, -0.25, 0.24, -0.05) # fixed effects coefficients
D11 <- 0.48 # variance of random intercepts
D22 <- 0.1 # variance of random slopes

# we simulate random effects
b <- cbind(rnorm(n, sd = sqrt(D11)), rnorm(n, sd = sqrt(D22)))
# linear predictor
eta_y <- drop(X %*% betas + rowSums(Z * b[DF$id, ]))
# we simulate binary longitudinal data
DF$y <- rbinom(n * K, 1, plogis(eta_y))

## ------------------------------------------------------------------------
fm1 <- mixed_model(fixed = y ~ sex * time, random = ~ 1 | id, data = DF,
                   family = binomial())

## ------------------------------------------------------------------------
summary(fm1)

## ------------------------------------------------------------------------
fm1_q11 <- fm1
fm1_q15 <- update(fm1_q11, nAGQ = 15)
fm1_q21 <- update(fm1_q11, nAGQ = 21)

models <- list("nAGQ=11" = fm1_q11, "nAGQ=15" = fm1_q15, "nAGQ=21" = fm1_q21)

## ------------------------------------------------------------------------
extract <- function (obj) {
    c(fixef(obj), "var_(Intercept)" = obj$D[1, 1], "logLik" = logLik(obj))
}

sapply(models, extract)

## ------------------------------------------------------------------------
fm2 <- mixed_model(fixed = y ~ sex * time, random = ~ time || id, data = DF,
                   family = binomial())

## ------------------------------------------------------------------------
anova(fm1, fm2)

## ------------------------------------------------------------------------
fm3 <- mixed_model(fixed = y ~ sex * time, random = ~ time | id, data = DF,
                   family = binomial())

## ------------------------------------------------------------------------
anova(fm2, fm3)

## ------------------------------------------------------------------------
set.seed(1234)
n <- 100 # number of subjects
K <- 8 # number of measurements per subject
t_max <- 15 # maximum follow-up time

# we constuct a data frame with the design: 
# everyone has a baseline measurment, and then measurements at random follow-up times
DF <- data.frame(id = rep(seq_len(n), each = K),
                 time = c(replicate(n, c(0, sort(runif(K - 1, 0, t_max))))),
                 sex = rep(gl(2, n/2, labels = c("male", "female")), each = K))

# design matrices for the fixed and random effects
X <- model.matrix(~ sex * time, data = DF)

betas <- c(2.13, -0.25, 0.24, -0.05) # fixed effects coefficients
D11 <- 0.48 # variance of random intercepts

# we simulate random effects
b <- rnorm(n, sd = sqrt(D11))
# linear predictor
eta_y <- drop(X %*% betas + b[DF$id])
# we simulate Poisson longitudinal data
DF$y <- rpois(n * K, exp(eta_y))

## ------------------------------------------------------------------------
gm1 <- mixed_model(fixed = y ~ sex * time, random = ~ 1 | id, data = DF,
                   family = poisson())

## ------------------------------------------------------------------------
summary(gm1)

## ------------------------------------------------------------------------
gm2 <- mixed_model(fixed = y ~ sex * time, random = ~ 1 | id, data = DF,
                   family = poisson(), penalized = TRUE)

## ------------------------------------------------------------------------
cbind('unpenalized' = fixef(gm1), 'penalized' = fixef(gm2))

## ---- eval = FALSE-------------------------------------------------------
#  gm3 <- mixed_model(fixed = y ~ sex * time, random = ~ 1 | id, data = DF,
#                     family = poisson(),
#                     penalized = list(pen_mu = 0, pen_sigma = 1, pen_df = 200))

