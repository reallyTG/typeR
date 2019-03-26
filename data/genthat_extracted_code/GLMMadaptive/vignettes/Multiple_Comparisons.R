## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)
library("GLMMadaptive")

## ------------------------------------------------------------------------
set.seed(1234)
n <- 300 # number of subjects
K <- 4 # number of measurements per subject
t_max <- 15 # maximum follow-up time

# we constuct a data frame with the design: 
# everyone has a baseline measurment, and then measurements at K time points
DF <- data.frame(id = rep(seq_len(n), each = K),
                 time = gl(K, 1, n*K, labels = paste0("Time", 1:K)),
                 sex = rep(gl(2, n/2, labels = c("male", "female")), each = K))

# design matrices for the fixed and random effects
X <- model.matrix(~ sex * time, data = DF)
Z <- model.matrix(~ 1, data = DF)

betas <- c(-2.13, 1, rep(c(1.2, -1.2), K-1)) # fixed effects coefficients
D11 <- 1 # variance of random intercepts

# we simulate random effects
b <- cbind(rnorm(n, sd = sqrt(D11)))
# linear predictor
eta_y <- as.vector(X %*% betas + rowSums(Z * b[DF$id, ]))
# we simulate binary longitudinal data
DF$y <- rbinom(n * K, 1, plogis(eta_y))

## ------------------------------------------------------------------------
fm <- mixed_model(fixed = y ~ sex + time, random = ~ 1 | id, data = DF,
                  family = binomial())

## ------------------------------------------------------------------------
summary(fm)

## ------------------------------------------------------------------------
library("multcomp")
fm_mc <- glht(fm, linfct = mcp(time = "Tukey"),
           vcov. = vcov(fm, "fixed"), coef. = fixef)

summary(fm_mc)

## ------------------------------------------------------------------------
gm <- mixed_model(fixed = y ~ sex * time, random = ~ 1 | id, data = DF,
                  family = binomial())

## ---- message = FALSE----------------------------------------------------
library("emmeans")
gm_mc <- emmeans(gm, ~ sex | time)

gm_mc

## ------------------------------------------------------------------------
pairs(gm_mc)

