## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>",
  fig.width=6
)

## ------------------------------------------------------------------------
# Load the hdme package
library(hdme)

## ------------------------------------------------------------------------
create_example_data <- function(n, p, s = 5, sdX = 1, sdU = 0.5, sdEpsilon = 0.1, family = "gaussian") {
  # Independent true covariates with mean zero and standard deviation sdX
  X <- matrix(rnorm(n * p, sd = sdX), nrow = n, ncol = p)
  # if Gaussian, response has standard deviation sdEpsilon, and the intercept is zero
  # if binomial, the response is binomially distributed with mean (1 + exp(-X %*% beta))^(-1)
  beta <- c(-2, -1, 0.5, 1, 2, rep(0, p - s))
  
  if(family == "gaussian") {
    # True coefficient vector has s non-zero elements and p-s zero elements
    y <- X %*% beta + rnorm(n, sd = sdEpsilon)  
  } else if (family == "binomial") {
    # Need an amplification in the binomial case
    beta <- beta * 3
    y <- rbinom(n, size = 1, prob = (1 + exp(-X %*% beta))**(-1))
  }
  
  # The measurements W have mean X and standard deviation sdU. We assume uncorrelated measurment errors
  W <- X + matrix(rnorm(n * p, sd = sdU), nrow = n, ncol = p)
  
  return(list(X = X, W = W, y = y, beta = beta, sigmaUU = diag(p) * sdU))  
}

## ---- message=FALSE------------------------------------------------------
# Need to attach igraph before zeallot, because of a conflict in the %<-% operator
library(igraph) 
library(zeallot)
n <- 100
p <- 500
set.seed(1000)
c(X, W, y, beta, sigmaUU) %<-% create_example_data(n, p)

## ---- message=FALSE------------------------------------------------------
library(glmnet)
library(dplyr)
# Lasso with cross-validation on data without measurement error
fit1 <- cv.glmnet(X, y)
# Lasso with cross-validation on data with measurement error
fit2 <- cv.glmnet(W, y)
# Create a data frame with results ([-1] because we drop the intercept)
lassoEstimates <- tibble(
  index = rep(1:p, times = 3),
  beta = c(beta, as.numeric(coef(fit1)[-1]), coef(fit2)[-1]),
  label = c(rep("True values", p), rep("No measurement error", p), rep("Measurement error", p))
  )


## ------------------------------------------------------------------------
library(ggplot2)
ggplot(lassoEstimates, aes(x = index, y = beta, color = label)) +
  geom_point() +
  xlab("p") +
  theme(legend.title=element_blank()) + 
  ggtitle("Measurement error leading to false positives")

## ---- message=FALSE, warning=FALSE---------------------------------------
library(tidyr) 
estimatesOfNonzero <- lassoEstimates %>% 
  spread(key = label, value = beta) %>% 
  filter(`True values` != 0) %>% 
  gather(key = label, value = beta, -index)

ggplot(estimatesOfNonzero, aes(x = index, y = beta, color = label)) +
  geom_point() +
  xlab("p") +
  theme(legend.title=element_blank()) + 
  ggtitle("Measurement error leading to attenuation")

## ---- message=FALSE------------------------------------------------------
library(flare)
n <- 100
p <- 500
set.seed(1000)
c(X, W, y, beta, sigmaUU) %<-% create_example_data(n, p)

## ------------------------------------------------------------------------
# No measurement error, using X
dantzig_fit_x <- slim(X, y, nlambda = 10, method = "dantzig", verbose = FALSE, lambda.min.ratio = 0.3)
# Measurement error, using W
dantzig_fit_w <- slim(W, y, nlambda = 10, method = "dantzig", verbose = FALSE, lambda.min.ratio = 0.3)

## ------------------------------------------------------------------------
plot(dantzig_fit_x)

## ------------------------------------------------------------------------
plot(dantzig_fit_w)

## ------------------------------------------------------------------------
# Number of samples
n <- 1000
# Number of covariates
p <- 50
# Create example data
c(X, W, y, beta, sigmaUU) %<-% create_example_data(n, p, family = "binomial")

## ------------------------------------------------------------------------
args(fit_gds)

## ------------------------------------------------------------------------
# Fit the Generalized Dantzig Selector
gds_estimate <- fit_gds(X, y, family = "binomial")

## ------------------------------------------------------------------------
class(gds_estimate)

## ------------------------------------------------------------------------
str(gds_estimate)

## ------------------------------------------------------------------------
set.seed(1000)
# Generate example data
c(X, W, y, beta, sigmaUU) %<-% create_example_data(n, p)
# Fit the corrected lasso
corrected_fit <- fit_corrected_lasso(W = W, y = y, sigmaUU = sigmaUU)

## ------------------------------------------------------------------------
# Class of the object
class(corrected_fit)
# Object is a list
typeof(corrected_fit)

## ------------------------------------------------------------------------
args(fit_corrected_lasso)

## ------------------------------------------------------------------------
plot(corrected_fit)

## ------------------------------------------------------------------------
plot(corrected_fit, type = "path")

## ------------------------------------------------------------------------
set.seed(323)
n <- 100
p <- 50
c(X, W, y, beta, sigmaUU) %<-% create_example_data(n, p, sdU = 0.2, family = "binomial")

## ------------------------------------------------------------------------
corrected_fit <- fit_corrected_lasso(W, y, sigmaUU, family = "binomial")

## ------------------------------------------------------------------------
plot(corrected_fit)

## ------------------------------------------------------------------------
plot(corrected_fit, type = "path")

## ------------------------------------------------------------------------
set.seed(1000)
# Generate example data
c(X, W, y, beta, sigmaUU) %<-% create_example_data(n, p)
# Run lasso with cross-validation
cv_corrected_fit <- cv_corrected_lasso(W = W, y = y, sigmaUU = sigmaUU)

## ------------------------------------------------------------------------
class(cv_corrected_fit)

## ------------------------------------------------------------------------
str(cv_corrected_fit)

## ------------------------------------------------------------------------
plot(cv_corrected_fit)

## ------------------------------------------------------------------------
corrected_fit <- fit_corrected_lasso(W, y, sigmaUU, radii = cv_corrected_fit$radius_1se)

## ------------------------------------------------------------------------
str(corrected_fit)

## ------------------------------------------------------------------------
set.seed(1)
# Number of samples
n <- 1000
# Number of covariates
p <- 50
# Generate data
c(X, W, y, beta, sigmaUU) %<-% create_example_data(n, p, sdU = 0.2)

## ------------------------------------------------------------------------
mus_fit <- fit_mus(W, y)
class(mus_fit)
str(mus_fit)

## ------------------------------------------------------------------------
plot(mus_fit)

## ------------------------------------------------------------------------
mus_fit <- fit_mus(W, y, delta = 0.1)

## ------------------------------------------------------------------------
plot(mus_fit)

## ------------------------------------------------------------------------
set.seed(323)
n <- 100
p <- 50
c(X, W, y, beta, sigmaUU) %<-% create_example_data(n, p, sdU = 0.2, family = "binomial")
gmus_fit <- fit_gmus(W, y, family = "binomial")

## ------------------------------------------------------------------------
class(gmus_fit)
str(gmus_fit)

## ------------------------------------------------------------------------
plot(gmus_fit)

## ------------------------------------------------------------------------
gmus_fit <- fit_gmus(W, y, delta = 0.1, family = "binomial")

## ------------------------------------------------------------------------
plot(gmus_fit)

## ------------------------------------------------------------------------
set.seed(323)
n <- 100
p <- 50
c(X, W, y, beta, sigmaUU) %<-% create_example_data(n, p, sdU = 0.2, family = "binomial")
gmu_lasso_fit <- fit_gmu_lasso(W, y, family = "binomial")

## ------------------------------------------------------------------------
class(gmu_lasso_fit)
str(gmu_lasso_fit)

## ------------------------------------------------------------------------
plot(gmu_lasso_fit)

