library(DTRreg)


### Name: chooseM
### Title: Adaptive Choice of the Bootstrap Resample Size M for the
###   m-out-of-n Bootstrap with for DTR Estimation
### Aliases: chooseM
### Keywords: dynamic treatment regimens,adaptive treatment
###   strategies,personalized medicine,g-estimation,dynamic weighted
###   ordinary least squares,m-out-of-n bootstrap,double bootstrap

### ** Examples

##################
# example single run of a 2-stage g-estimation analysis
set.seed(1)
# expit function
expit <- function(x) {1 / (1 + exp(-x))}
# sample size
n <- 100
# variables (X = patient information, A = treatment)
X1 <- rnorm(n)
A1 <- rbinom(n, 1, expit(X1))
X2 <- rnorm(n)
A2 <- rbinom(n, 1, expit(X2))
# blip functions
gamma1 <- A1 * (1 + X1)
gamma2 <- A2 * (1 + X2)
# observed outcome: treatment-free outcome plus blip functions
Y <- exp(X1) + exp(X2) + gamma1 + gamma2 + rnorm(n)
# models to be passed to DTRreg
# blip model
blip.mod <- list(~X1, ~X2)
# treatment model (correctly specified)
treat.mod <- list(A1~X1, A2~X2)
# treatment-free model (incorrectly specified)
tf.mod <- list(~X1, ~X2)

# perform dWOLS without calculating confidence intervals
mod1 <- DTRreg(Y, blip.mod, treat.mod, tf.mod, method = "dwols")

# choose m adaptively for that model
# m <- chooseM(Y, blip.mod, treat.mod, tf.mod, method = "dwols", B1 = 200, B2 = 200)$m
m <- 94

# perform dWOLS and calculate confidence intervals with the m-out-of-n bootstrap
mod2 <- DTRreg(Y, blip.mod, treat.mod, tf.mod, method = "dwols", var.estim = "bootstrap", M = m)

##################



