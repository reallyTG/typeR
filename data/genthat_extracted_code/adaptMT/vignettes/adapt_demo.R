## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ---- results='hide'-----------------------------------------------------
# install the "adaptMT" package from github.
# will be submitted to CRAN very soon.
# devtools::install_github("lihualei71/adaptMT")
library("adaptMT")

## ---- out.width = "75%", out.height = "250px", fig.align = "center", echo = FALSE----
knitr::include_graphics('flowchart_AdaPT.pdf')

## ----results='hide'------------------------------------------------------
# load the data.
data("estrogen")
# Take the first 5000 genes
if (!requireNamespace("dplyr")){
  install.packages("dplyr")
}
library("dplyr")
estrogen <- select(estrogen, pvals, ord_high) %>% 
  filter(ord_high <= 5000)
rownames(estrogen) <- NULL

## ------------------------------------------------------------------------
head(estrogen, 5)

## ------------------------------------------------------------------------
summary(estrogen)

## ---- echo=FALSE, fig.height=5, fig.width=7------------------------------
  plot(estrogen$ord, estrogen$pvals, pch = ".", xlab = "order", ylab = "p-values", xaxs = "i", yaxs = "i", main = "Scatter plot of p-values in the (sub-sampled) estrogen dataset")

## ------------------------------------------------------------------------
# prepare the inputs of AdaPT
# need "splines" package to construct the formula for glm
library("splines")
pvals <- as.numeric(estrogen$pvals)
x <- data.frame(x = as.numeric(estrogen$ord))
formulas <- paste0("ns(x, df = ", 6:10, ")")
formulas

## ---- warning=FALSE------------------------------------------------------
# run AdaPT
res_glm <- adapt_glm(x = x, pvals = pvals, pi_formulas = formulas, mu_formulas = formulas)

## ---- echo=FALSE, fig.height=5, fig.width=7------------------------------
par(mfrow = c(2, 3))
for (alpha in seq(0.3, 0.05, -0.05)){
  nrejs <- res_glm$nrejs[floor(alpha * 100)]
  title <- paste0("alpha = ", alpha, ", nrejs = ", nrejs)
  plot_1d_thresh(res_glm, x, pvals, alpha, title, disp_ymax = 1, xlab = "order")
}

## ---- fig.height=5, fig.width=7------------------------------------------
par(mfrow = c(2, 3))
for (alpha in seq(0.3, 0.05, -0.05)){
  nrejs <- res_glm$nrejs[floor(alpha * 100)]
  title <- paste0("alpha = ", alpha, ", nrejs = ", nrejs)
  plot_1d_lfdr(res_glm, x, pvals, alpha, title, disp_ymax = 0.25, xlab = "order")
}

## ------------------------------------------------------------------------
# Generate a 2-dim x
n <- 400
x1 <- x2 <- seq(-100, 100, length.out = 20)
x <- expand.grid(x1, x2)
colnames(x) <- c("x1", "x2")

# Generate p-values (one-sided z test)
H0 <- apply(x, 1, function(coord){sum(coord^2) < 40^2})
mu <- ifelse(H0, 2, 0)
set.seed(0)
zvals <- rnorm(n) + mu
pvals <- 1 - pnorm(zvals)

## ------------------------------------------------------------------------
# install.packages("mgcv")
library("mgcv")

## ------------------------------------------------------------------------
formula <- "s(x1, x2)"
res_gam <- adapt_gam(x = x, pvals = pvals, pi_formulas = formula, mu_formulas = formula)

## ---- fig.height=3.5, fig.width=7----------------------------------------
par(mfrow = c(1, 2), mar = c(4, 4, 2, 2))
# Truth
plot(x[, 1], x[, 2], type = "p", xlab = "", ylab = "", col = ifelse(H0, "#000000", "#A9A9A9"), cex = 2, pch = 15)
# Rejection set
rej <- pvals <= res_gam$s[, 10]
plot(x[, 1], x[, 2], type = "p", xlab = "", ylab = "", col = ifelse(rej, "#800000", "#FFB6C1"), cex = 2, pch = 15)

## ---- fig.height=4.5, fig.width=6----------------------------------------
plot_2d_thresh(res_gam, x, pvals, 0.1, "P-Value Threshold", xlab = "", ylab = "")

## ---- fig.height=4.5, fig.width=6----------------------------------------
par(mfrow = c(2, 2), mar = c(4, 4, 2, 2))
for (targetp in c(0.001, 0.005, 0.01, 0.05)){
  title <- paste0("Local FDR Estimates (p = ", targetp, ")")
  plot_2d_lfdr(res_gam, x, pvals, 0.1, title, targetp, xlab = "", ylab = "")
}

## ------------------------------------------------------------------------
set.seed(0)
m <- 50
n <- 500
x <- matrix(runif(n * m), n, m)

## ------------------------------------------------------------------------
inv_logit <- function(x) {exp(x) / (1 + exp(x))}
pi <- inv_logit(x[, 1] * 2 + x[, 2] * 2 - 3)
mu <- pmax(1, x[, 1] * 2 + x[, 2] * 2)

## ------------------------------------------------------------------------
H0 <- as.logical(ifelse(runif(n) < pi, 1, 0))
y <- ifelse(H0, rexp(n, 1/mu), rexp(n, 1))
pvals <- exp(-y)

## ------------------------------------------------------------------------
res <- adapt_glmnet(x, pvals, s0 = rep(0.15, n), nfits = 5)

## ---- out.width = "450px", out.height = "250px", fig.align = "center", echo = FALSE----
knitr::include_graphics('flowchart_EM.pdf')

## ---- out.width = "500px", out.height = "250px", fig.align = "center", echo = FALSE----
knitr::include_graphics('flowchart_EM_ms.pdf')

## ------------------------------------------------------------------------
# g function
g <- function(x){
    tmp <- -log(x)
    pmax(pmin(tmp, -log(10^-15)), -log(1-10^-15))
}
# inverse function of g
ginv <- function(x){
    tmp <- exp(-x)
    pmax(pmin(tmp, 1 - 10^-15), 10^-15)
}
# eta function (mapping from the mean parameter to the natural parameter)
eta <- function(mu){-1/mu}
# mu* (the mean parameter corresponding to U([0, 1]))
mustar <- 1
# A function (the partition function)
A <- log
# Set a name; optional
name <- "beta"
# Set the default family as Gamma() (for glm, gam, glmnet, etc.); optional
family <- Gamma()
# Generate beta_family()
beta_family <- gen_exp_family(g, ginv, eta, mustar, A, name, family)

## ------------------------------------------------------------------------
pifun_glm <- function(formula, data, weights, ...){
  formula <- as.formula(formula) # Transform the argument `formula` from character to formula
  fit <- stats::glm(formula, data, weights = weights,
                    family = quasibinomial(), ...) 
  # Here quasibinomial() family gets rid of meaningless warning messages
  fitv <- predict(fit, type = "response") # fitted values for pi1(x)
  info <- list(df = fit$rank) # degree-of-freedom being the rank of the design matrix
  return(list(fitv = fitv, info = info))
}

mufun_glm <- function(formula, data, weights, ...){
  formula <- as.formula(formula) # Transform the argument `formula` from character to formula
  fit <- stats::glm(formula, data, weights = weights,
                family = Gamma(), ...)
  fitv <- predict(fit, type = "response") # fitted values for mu(x)
  info <- list(df = fit$rank) # degree-of-freedom being the rank of the design matrix
  return(list(fitv = fitv, info = info))
}

## ------------------------------------------------------------------------
pifun_glmnet <- function(x, y, weights, ...){
  fit <- glmnet::cv.glmnet(x, y, weights = weights, family = "binomial", ...) 
  fitv <- predict(fit, newx = x, s = "lambda.min", type = "response") # fitted values for pi1(x)
  beta <- coef(fit, s = "lambda.min")
  info <- list(df = sum(beta != 0)) # degree-of-freedom being the number of non-zero coefficients
  return(list(fitv = fitv, info = info))
}

mufun_glmnet <- function(x, y, weights, ...){
  fit <- HDtweedie::cv.HDtweedie(x, y, p = 2, weights = weights, ...)
  fitv <- predict(fit, newx = x, s = "lambda.min", type = "response") # fitted values for mu(x)
  beta <- coef(fit, s = "lambda.min")
  info <- list(df = sum(beta != 0)) # degree-of-freedom being the number of non-zero coefficients
  return(list(fitv = fitv, info = info))
}

## ------------------------------------------------------------------------
pifun_init_glm <- function(x, pvals, s, 
                       formula, ...){
    # The input `formula` is a half-formula of type character, e.g. ~ ns(x, df = 8)
    J <- ifelse(
        pvals < s | pvals > 1 - s, 1,
        2 * s / (2 * s - 1)
        )

    # Complete the formula by adding the response variable J
    complete_formula <- as.formula(paste("J", formula)) 
    data <- data.frame(x, J = J)
    mod <- stats::glm(complete_formula, family = gaussian(), data = data)
    
    fitv <- as.numeric(predict(mod, type = "response"))
    info <- list(df = fit$rank)
    
    return(list(fitv = fitv, info = info))
}

mufun_init_glm <- function(x, pvals, s, ...){
    phat <- ifelse(
        pvals < s | pvals > 1 - s,
        pmin(pvals, 1 - pvals),
        pvals
        )
    yhat <- dist$g(phat)

    # Complete the formula by adding the response variable yhat
    complete_formula <- as.formula(paste("yhat", formula)) 
    data <- data.frame(x, yhat = yhat)
    mod <- stats::glm(complete_formula, family = Gamma(), data = data)
    
    fitv <- as.numeric(predict(mod, type = "response"))
    info <- list(df = fit$rank)
    
    return(list(fitv = fitv, info = info))
}

## ------------------------------------------------------------------------
library("splines") 
piargs <- muargs <- list(formula = "~ ns(x, df = 5)")
adapt_model_glm_example <- gen_adapt_model(
  pifun = pifun_glm, mufun = mufun_glm, 
  pifun_init = pifun_init_glm, mufun_init = mufun_init_glm,
  piargs = piargs, muargs = muargs,
  piargs_init = piargs, muargs_init = muargs
)

## ------------------------------------------------------------------------
adapt_model_glm_example2 <- gen_adapt_model(
  name = "glm",
  piargs = piargs, muargs = muargs
)

## ------------------------------------------------------------------------
data(estrogen)
pvals <- as.numeric(estrogen$pvals)
x <- data.frame(x = as.numeric(estrogen$ord_high))
dist <- beta_family()
inds <- (x$x <= 1000)
pvals <- pvals[inds]
x <- x[inds,,drop = FALSE]

res1 <- adapt_glm(x = x, pvals = pvals, pi_formulas = "~ ns(x, df = 5)", mu_formulas = "~ ns(x, df = 5)")
res2 <- adapt(x = x, pvals = pvals, models = adapt_model_glm_example2)
identical(res1$s, res2$s)

