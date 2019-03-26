params <-
list(EVAL = TRUE)

## ---- SETTINGS-knitr, include=FALSE--------------------------------------
stopifnot(require(knitr))
opts_chunk$set(
  comment=NA, 
  message = FALSE, 
  warning = FALSE, 
  eval = params$EVAL,
  dev = "png",
  dpi = 150,
  fig.asp = 0.618,
  fig.width = 5,
  out.width = "60%",
  fig.align = "center"
)

## ---- SETTINGS-gg, include=FALSE-----------------------------------------
library(ggplot2)
theme_set(bayesplot::theme_default())

## ---- SETTINGS-rstan, include=FALSE--------------------------------------
ITER <- 500L
CHAINS <- 2L
CORES <- 2L
SEED <- 12345

## ---- SETTINGS-loo, include=FALSE----------------------------------------
loo.cores <- if (exists("CORES")) CORES else 1L
options(mc.cores = loo.cores)

## ---- default-prior-1, results="hide"------------------------------------
library("rstanarm")
default_prior_test <- stan_glm(mpg ~ wt + am, data = mtcars, chains = 1)

## ---- default-prior-summary----------------------------------------------
prior_summary(default_prior_test)

## ---- echo=FALSE---------------------------------------------------------
priors <- prior_summary(default_prior_test)
fr2 <- function(x) format(round(x, 2), nsmall = 2)

## ---- no-autoscale, results="hide"---------------------------------------
test_no_autoscale <-
  update(
    default_prior_test,
    prior = normal(0, 5, autoscale = FALSE),
    prior_intercept = student_t(4, 0, 10, autoscale = FALSE),
    prior_aux = cauchy(0, 3, autoscale = FALSE)
  )

## ---- no-autoscale-prior-summary-----------------------------------------
prior_summary(test_no_autoscale)

## ------------------------------------------------------------------------
p <- 1 - 2 * pnorm(-250, mean = 0, sd = 500)
print(paste("Pr(-250 < theta < 250) =", round(p, 2)))

## ---- fig.cap="_There is much more probability mass outside the interval (-250, 250)._"----
theta <- rnorm(1e5, mean = 0, sd = 500)
p_approx <- mean(abs(theta) < 250)
print(paste("Pr(-250 < theta < 250) =", round(p_approx, 2)))

d <- data.frame(theta, clr = abs(theta) > 250)
ggplot(d, aes(x = theta, fill = clr)) + 
  geom_histogram(binwidth = 5, show.legend = FALSE) + 
  scale_y_continuous(name = "", labels = NULL, expand = c(0,0)) + 
  scale_x_continuous(name = expression(theta), breaks = c(-1000, -250, 250, 1000))

## ---- flat-prior-1, echo=FALSE, results="hide"---------------------------
flat_prior_test <- stan_glm(mpg ~ wt, data = mtcars, prior = NULL, iter = 10, chains = 1)

## ---- flat-prior-2, eval=FALSE-------------------------------------------
#  flat_prior_test <- stan_glm(mpg ~ wt, data = mtcars, prior = NULL)

## ---- flat-prior-summary-------------------------------------------------
prior_summary(flat_prior_test)

## ---- eval=FALSE---------------------------------------------------------
#  my_prior <- normal(location = c(-10, 0), scale = c(5, 2), autoscale = FALSE)
#  stan_glm(y ~ x1 + x2, data = dat, prior = my_prior)

