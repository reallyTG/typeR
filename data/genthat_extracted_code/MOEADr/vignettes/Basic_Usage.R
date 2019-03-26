## ------------------------------------------------------------------------
sphere <- function(X) {
  X.shift <- X + seq_along(X)*0.1     # displace input parameters
  sum(X.shift**2) }
rastringin <- function(X) {
  X.shift <- X - seq_along(X)*0.1     # displace input parameters in the opposite direction
  sum((X.shift)**2 - 10 * cos(2 * pi * X.shift) + 10) }

## ------------------------------------------------------------------------
problem.sr <- function(X) {
  t(apply(X, MARGIN = 1,
          FUN = function(X) { c(sphere(X), rastringin(X)) } 
   ))
}

## ------------------------------------------------------------------------
problem.1 <- list(name       = "problem.sr",  # function that executes the MOP
                  xmin       = rep(-1,30),    # minimum parameter value for each dimension
                  xmax       = rep(1,30),     # maximum parameter value for each dimension
                  m          = 2)             # number of objectives

## ---- collapse = TRUE, comment = "#>"------------------------------------
library(MOEADr)
results <- moead(problem  = problem.1,
                 preset   = preset_moead("original"),
                 showpars = list(show.iters = "none"), 
                 seed     = 42)

## ---- collapse = TRUE, comment = "#>"------------------------------------
preset_moead()

## ----collapse = TRUE, comment = "#>", fig.align="center", fig.width=6, fig.height=6----
summary(results)
plot(results, suppress.pause = TRUE)

## ----collapse = TRUE, comment = "#>"-------------------------------------
library(smoof)
DTLZ2 <- make_vectorized_smoof(prob.name  = "DTLZ2",
                               dimensions = 20,
                               n.objectives = 5)
problem.dtlz2  <- list(name       = "DTLZ2",
                       xmin       = rep(0, 20),
                       xmax       = rep(1, 20),
                       m          = 5)

## ---- collapse = TRUE, comment = "#>"------------------------------------
results.dtlz <- moead(problem = problem.dtlz2,
                preset = preset_moead("original"),
                decomp = list(name = "SLD", H = 8), 
                showpars = list(show.iters = "dots"), 
                seed = 42)

## ----collapse = TRUE, comment = "#>", fig.align="center", fig.width=6, fig.height=6----
summary(results.dtlz)
plot(results.dtlz, suppress.pause = TRUE)

