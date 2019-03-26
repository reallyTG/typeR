## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>",
  eval = FALSE
)

## ------------------------------------------------------------------------
#  # generate data
#  set.seed(1)
#  n <- 200
#  p <- 20
#  X <- matrix(rnorm(n * p), ncol = p)
#  colnames(X) <- paste0("X", 1:p)
#  y <- 1 + 0.4 * rowSums(X[, c(5, 10, 15, 20)]) + rnorm(n)

## ------------------------------------------------------------------------
#  library(bigstep)
#  data <- prepare_data(y, X)

## ------------------------------------------------------------------------
#  results <- stepwise(data, crit = aic)
#  results$model
#  summary(results)

## ------------------------------------------------------------------------
#  forward(data, crit = aic)

## ------------------------------------------------------------------------
#  data %>%
#    forward(aic) %>%
#    forward(aic) %>%
#    forward(aic) %>%
#    backward(bic)

## ------------------------------------------------------------------------
#  # generate data
#  set.seed(1)
#  n <- 1e3
#  p <- 1e4
#  X <- matrix(rnorm(p * n), ncol = p)
#  colnames(X) <- paste0("X", 1:p)
#  Xadd <- matrix(rnorm(5 * n), n, 5)  # additional variables
#  colnames(Xadd) <- paste0("Xadd", 1:5)
#  y <- 0.2 * rowSums(X[, 1000 * (1:10)]) + Xadd[, 1] - 0.1 * Xadd[, 3] + rnorm(n)

## ------------------------------------------------------------------------
#  data <- prepare_data(y, X, Xadd = Xadd)
#  data %>%
#    reduce_matrix(minpv = 0.15) %>%
#    stepwise(mbic) ->
#    results
#  summary(results)
#  
#  data %>%
#    reduce_matrix(0.15) %>%
#    stepwise(bic) # bad idea...

## ------------------------------------------------------------------------
#  data %>%
#    reduce_matrix() %>%
#    fast_forward() %>%
#    multi_backward() %>%
#    stepwise()

## ------------------------------------------------------------------------
#  Xbig <- read.big.matrix("X.txt", sep = " ", header = TRUE,
#                          backingfile = "X.bin", descriptorfile = "X.desc")
#  # Xbig <- attach.big.matrix("X.desc") # much faster
#  y <- read.table("y.txt")
#  # data <- prepare_data(y, Xbig) # slow because of checking NA
#  data <- prepare_data(y, Xbig, na = FALSE) # set if you know that you do not have NA
#  data %>%
#    reduce_matrix(minpv = 0.001) %>%
#    fast_forward(crit = bic, maxf = 50) %>%
#    multi_backward(crit = mbic) %>%
#    stepwise(crit = mbic) -> m
#  summary(m)

## ------------------------------------------------------------------------
#  my_crit <- function(loglik, k, n, c1 = 0.5, c2 = 8) {
#    -c1*loglik + 10*sqrt(k*c2)
#  }
#  m <- reduce_matrix(data, minpv = 0.15) # data from the paragraph "Bigger data"
#  stepwise(m, crit = my_crit)
#  stepwise(m, crit = function(loglik, k, n) -0.4*loglik + 10*sqrt(k*8))

## ------------------------------------------------------------------------
#  # Poisson model
#  set.seed(1)
#  n <- 50
#  p <- 1000
#  X <- matrix(runif(n * p), ncol = p)
#  colnames(X) <- paste0("X", 1:p)
#  mu <- rowSums(X[, 100 * (1:5)])
#  y <- rpois(n, exp(mu))
#  data1 <- prepare_data(y, X, type = "linear")
#  data2 <- prepare_data(y, X, type = "poisson")
#  data1 %>%
#    reduce_matrix() %>%
#    stepwise() # did not see any variables
#  data2 %>%
#    reduce_matrix() %>%
#    stepwise()
#  
#  # logistic model
#  set.seed(2)
#  n <- 100
#  X <- matrix(runif(n * p, -5, 5), ncol = p)
#  colnames(X) <- paste0("X", 1:p)
#  mu <- 0.8 * rowSums(X[, 100 * (1:5)])
#  prob <- 1 /( 1 + exp(-mu))
#  y <- rbinom(n, 1, prob)
#  data1 <- prepare_data(y, X, type = "linear")
#  data2 <- prepare_data(y, X, type = "logistic")
#  data1 %>%
#    reduce_matrix() %>%
#    stepwise()
#  data2 %>%
#    reduce_matrix() %>%
#    stepwise()

