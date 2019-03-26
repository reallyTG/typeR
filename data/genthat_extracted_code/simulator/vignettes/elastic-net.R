## ----setup, include=FALSE------------------------------------------------
library(knitr)
code <- file.path("elastic-net",
                  c("model_functions.R", 
                    "method_functions.R",
                    "eval_functions.R", 
                    "main.R"))
code_lastmodified <- max(file.info(code)$mtime)
sapply(code, read_chunk)

## ------------------------------------------------------------------------
library(simulator)

## ---- echo = FALSE, results = 'hide', warning = FALSE, message = FALSE----
library(mvtnorm)
make_sparse_linear_model_with_corr_design <- function(n, p, k, snr, rho) {
  sig <- matrix(rho, p, p)
  diag(sig) <- 1
  x <- rmvnorm(n, sigma = sig)
  beta <- rep(c(1, 0), c(k, p - k))
  mu <- as.numeric(x %*% beta)
  sigma <- sqrt(sum(mu^2) / (n * snr)) # taking snr = ||mu||^2 / (n * sigma^2)
  new_model(name = "slm", label = sprintf("rho = %s", rho),
            params = list(x = x, beta = beta, mu = mu, sigma = sigma, n = n,
                          p = p, k = k),
            simulate = function(mu, sigma, nsim) {
              y <- mu + sigma * matrix(rnorm(nsim * n), n, nsim)
              return(split(y, col(y))) # make each col its own list element
            })
}
library(glmnet)
make_elastic_net <- function(alpha) {
  new_method(name = sprintf("en%s", alpha),
             label = sprintf("EN(a = %s)", alpha),
             settings = list(alpha = alpha, nlam = 50),
             method = function(model, draw, alpha, nlam, lambda = NULL) {
                      if (is.null(lambda))
                        fit <- glmnet(x = model$x, y = draw, alpha = alpha,
                                      nlambda = nlam, intercept = FALSE)
                      else
                        fit <- glmnet(x = model$x, y = draw, alpha = alpha,
                                      lambda = lambda, intercept = FALSE)
                      list(beta = fit$beta, yhat = model$x %*% fit$beta,
                           lambda = fit$lambda, df = fit$df, alpha = alpha)
                    })
}

list_of_elastic_nets <- sapply(c(0, 0.5, 1), make_elastic_net)
#' Make folds for cross validation
#'
#' Divides the indices \code{1:n} into \code{nfolds} random folds of about the same size.
#'
#' @param n sample size
#' @param nfolds number of folds
make_folds <- function(n, nfolds) {
  nn <- round(n / nfolds)
  sizes <- rep(nn, nfolds)
  sizes[nfolds] <- sizes[nfolds] + n - nn * nfolds
  b <- c(0, cumsum(sizes))
  ii <- sample(n)
  folds <- list()
  for (i in seq(nfolds))
    folds[[i]] <- ii[seq(b[i] + 1, b[i + 1])]
  folds
}

cv <- new_method_extension("cv", "cross validated",
                           method_extension = function(model, draw, out,
                                                       base_method) {
                             nfolds <- 5
                             alpha <- base_method@settings$alpha
                             err <- matrix(NA, ncol(out$beta), nfolds)
                             ii <- make_folds(model$n, nfolds)
                             for (i in seq_along(ii)) {
                               train <- model
                               train@params$x <- model@params$x[-ii[[i]], ]
                               train@params$n <- model@params$x[-ii[[i]], ]
                               train_draw <- draw[-ii[[i]]]

                               test <- model
                               test@params$x <- model@params$x[ii[[i]], ]
                               test@params$n <- model@params$x[ii[[i]], ]
                               test_draw <- draw[ii[[i]]]
                               fit <- base_method@method(model = train,
                                                         draw = train_draw,
                                                         alpha = alpha,
                                                         lambda = out$lambda)
                               yhat <- test$x %*% fit$beta
                               ll <- seq(ncol(yhat))
                               err[ll, i] <- colMeans((yhat - test_draw)^2)
                             }
                             m <- rowMeans(err)
                             se <- apply(err, 1, sd) / sqrt(nfolds)
                             imin <- which.min(m)
                             ioneserule <- max(which(m <= m[imin] + se[imin]))
                             list(err = err, m = m, se = se, imin = imin,
                                  ioneserule = ioneserule,
                                  beta = out$beta[, imin],
                                  yhat = model$x %*% out$beta[, imin],
                                  alpha = alpha)
                           })
sqr_err <- new_metric("sqr_err", "squared error",
                  metric = function(model, out) {
                    colMeans(as.matrix(out$beta - model$beta)^2)
                  })

best_sqr_err <- new_metric("best_sqr_err", "best squared error",
                      metric = function(model, out) {
                        min(colMeans(as.matrix(out$beta - model$beta)^2))
                      })

nnz <- new_metric("nnz", "number of nonzeros",
                  metric = function(model, out) {
                    colSums(as.matrix(out$beta) != 0)
                  })

## ---- eval = FALSE-------------------------------------------------------
#  name_of_simulation <- "elastic-net"
#  sim <- new_simulation(name_of_simulation, "Elastic Nets") %>%
#    generate_model(make_sparse_linear_model_with_corr_design,
#                   n = 100, p = 50, snr = 2, k = 10,
#                   rho = as.list(seq(0, 0.8, length = 6)),
#                   vary_along = "rho") %>%
#    simulate_from_model(nsim = 3, index = 1:4) %>%
#    run_method(list_of_elastic_nets,
#               parallel = list(socket_names = 2, libraries = "glmnet")) %>%
#    evaluate(list(sqr_err, nnz, best_sqr_err))

## ---- echo = FALSE, results = 'hide', message = FALSE, warning = FALSE----
name_of_simulation <- "elastic-net"
sim_lastmodified <- file.info(sprintf("files/sim-%s.Rdata",
                              name_of_simulation))$mtime
if (is.na(sim_lastmodified) || code_lastmodified > sim_lastmodified) {
  sim <- new_simulation(name_of_simulation, "Elastic Nets") %>%
    generate_model(make_sparse_linear_model_with_corr_design,
                   n = 100, p = 50, snr = 2, k = 10,
                   rho = as.list(seq(0, 0.8, length = 6)),
                   vary_along = "rho") %>%
    simulate_from_model(nsim = 3, index = 1:4) %>%
    run_method(list_of_elastic_nets,
               parallel = list(socket_names = 2, libraries = "glmnet")) %>%
    evaluate(list(sqr_err, nnz, best_sqr_err))
  sim_cv <- sim %>% subset_simulation(methods = "") %>%
    rename("elastic-net-cv") %>%
    relabel("Elastic Nets with CV") %>%
    run_method(list_of_elastic_nets + cv,
               parallel = list(socket_names = 2, libraries = "glmnet")) %>%
    evaluate(list(sqr_err, nnz))
} else{
  sim <- load_simulation(name_of_simulation)
  sim_cv <- load_simulation("elastic-net-cv")
}

## ---- fig.width = 7, fig.height = 5, results = 'hide', warning = FALSE, message = FALSE----
plot_evals(sim, "nnz", "sqr_err")

## ---- fig.width = 7, fig.height = 5, results = 'hide', warning = FALSE, message = FALSE----
plot_eval_by(sim, "best_sqr_err", varying = "rho", include_zero = TRUE)

## ---- fig.width = 7, fig.height = 5, results = 'hide', warning = FALSE, message = FALSE----
plot_eval(sim, "time", include_zero = TRUE)

## ---- eval = FALSE-------------------------------------------------------
#  sim_cv <- sim %>% subset_simulation(methods = "") %>%
#    rename("elastic-net-cv") %>%
#    relabel("Elastic Nets with CV") %>%
#    run_method(list_of_elastic_nets + cv,
#               parallel = list(socket_names = 2, libraries = "glmnet")) %>%
#    evaluate(list(sqr_err, nnz))

## ---- fig.width = 6, fig.height = 4, results = 'hide', warning = FALSE, message = FALSE----
plot_eval_by(sim_cv, "sqr_err", varying = "rho", include_zero = TRUE)

## ---- eval = FALSE-------------------------------------------------------
#  library(mvtnorm)
#  make_sparse_linear_model_with_corr_design <- function(n, p, k, snr, rho) {
#    sig <- matrix(rho, p, p)
#    diag(sig) <- 1
#    x <- rmvnorm(n, sigma = sig)
#    beta <- rep(c(1, 0), c(k, p - k))
#    mu <- as.numeric(x %*% beta)
#    sigma <- sqrt(sum(mu^2) / (n * snr)) # taking snr = ||mu||^2 / (n * sigma^2)
#    new_model(name = "slm", label = sprintf("rho = %s", rho),
#              params = list(x = x, beta = beta, mu = mu, sigma = sigma, n = n,
#                            p = p, k = k),
#              simulate = function(mu, sigma, nsim) {
#                y <- mu + sigma * matrix(rnorm(nsim * n), n, nsim)
#                return(split(y, col(y))) # make each col its own list element
#              })
#  }

## ---- eval = FALSE-------------------------------------------------------
#  library(glmnet)
#  make_elastic_net <- function(alpha) {
#    new_method(name = sprintf("en%s", alpha),
#               label = sprintf("EN(a = %s)", alpha),
#               settings = list(alpha = alpha, nlam = 50),
#               method = function(model, draw, alpha, nlam, lambda = NULL) {
#                        if (is.null(lambda))
#                          fit <- glmnet(x = model$x, y = draw, alpha = alpha,
#                                        nlambda = nlam, intercept = FALSE)
#                        else
#                          fit <- glmnet(x = model$x, y = draw, alpha = alpha,
#                                        lambda = lambda, intercept = FALSE)
#                        list(beta = fit$beta, yhat = model$x %*% fit$beta,
#                             lambda = fit$lambda, df = fit$df, alpha = alpha)
#                      })
#  }
#  
#  list_of_elastic_nets <- sapply(c(0, 0.5, 1), make_elastic_net)

## ---- eval = FALSE-------------------------------------------------------
#  #' Make folds for cross validation
#  #'
#  #' Divides the indices \code{1:n} into \code{nfolds} random folds of about the same size.
#  #'
#  #' @param n sample size
#  #' @param nfolds number of folds
#  make_folds <- function(n, nfolds) {
#    nn <- round(n / nfolds)
#    sizes <- rep(nn, nfolds)
#    sizes[nfolds] <- sizes[nfolds] + n - nn * nfolds
#    b <- c(0, cumsum(sizes))
#    ii <- sample(n)
#    folds <- list()
#    for (i in seq(nfolds))
#      folds[[i]] <- ii[seq(b[i] + 1, b[i + 1])]
#    folds
#  }
#  
#  cv <- new_method_extension("cv", "cross validated",
#                             method_extension = function(model, draw, out,
#                                                         base_method) {
#                               nfolds <- 5
#                               alpha <- base_method@settings$alpha
#                               err <- matrix(NA, ncol(out$beta), nfolds)
#                               ii <- make_folds(model$n, nfolds)
#                               for (i in seq_along(ii)) {
#                                 train <- model
#                                 train@params$x <- model@params$x[-ii[[i]], ]
#                                 train@params$n <- model@params$x[-ii[[i]], ]
#                                 train_draw <- draw[-ii[[i]]]
#  
#                                 test <- model
#                                 test@params$x <- model@params$x[ii[[i]], ]
#                                 test@params$n <- model@params$x[ii[[i]], ]
#                                 test_draw <- draw[ii[[i]]]
#                                 fit <- base_method@method(model = train,
#                                                           draw = train_draw,
#                                                           alpha = alpha,
#                                                           lambda = out$lambda)
#                                 yhat <- test$x %*% fit$beta
#                                 ll <- seq(ncol(yhat))
#                                 err[ll, i] <- colMeans((yhat - test_draw)^2)
#                               }
#                               m <- rowMeans(err)
#                               se <- apply(err, 1, sd) / sqrt(nfolds)
#                               imin <- which.min(m)
#                               ioneserule <- max(which(m <= m[imin] + se[imin]))
#                               list(err = err, m = m, se = se, imin = imin,
#                                    ioneserule = ioneserule,
#                                    beta = out$beta[, imin],
#                                    yhat = model$x %*% out$beta[, imin],
#                                    alpha = alpha)
#                             })

## ---- eval = FALSE-------------------------------------------------------
#  sqr_err <- new_metric("sqr_err", "squared error",
#                    metric = function(model, out) {
#                      colMeans(as.matrix(out$beta - model$beta)^2)
#                    })
#  
#  best_sqr_err <- new_metric("best_sqr_err", "best squared error",
#                        metric = function(model, out) {
#                          min(colMeans(as.matrix(out$beta - model$beta)^2))
#                        })
#  
#  nnz <- new_metric("nnz", "number of nonzeros",
#                    metric = function(model, out) {
#                      colSums(as.matrix(out$beta) != 0)
#                    })

## ---- results='asis'-----------------------------------------------------
citation("simulator")

