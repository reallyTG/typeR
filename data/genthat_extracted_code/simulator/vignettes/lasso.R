## ----setup, include=FALSE------------------------------------------------
library(knitr)
code <- file.path("lasso",
                  c("model_functions.R", 
                    "method_functions.R",
                    "eval_functions.R", 
                    "main.R"))
code_lastmodified <- max(file.info(code)$mtime)
sapply(code, read_chunk)

## ------------------------------------------------------------------------
library(simulator)

## ---- echo = FALSE, results = 'hide', warning = FALSE, message = FALSE----
make_sparse_linear_model <- function(n, p, k, snr) {
  x <- matrix(rnorm(n * p), n, p)
  beta <- rep(c(1, 0), c(k, p - k))
  mu <- as.numeric(x %*% beta)
  sigma <- sqrt(sum(mu^2) / (n * snr)) # taking snr = ||mu||^2 / (n * sigma^2)
  new_model(name = "slm", label = sprintf("n = %s, p = %s, k = %s", n, p, k),
            params = list(x = x, beta = beta, mu = mu, sigma = sigma, n = n,
                          p = p, k = k),
            simulate = function(mu, sigma, nsim) {
              y <- mu + sigma * matrix(rnorm(nsim * n), n, nsim)
              return(split(y, col(y))) # make each col its own list element
            })
}
library(glmnet)
lasso <- new_method("lasso", "Lasso",
                    method = function(model, draw, lambda = NULL) {
                      if (is.null(lambda))
                        fit <- glmnet(x = model$x, y = draw, nlambda = 50,
                                      intercept = FALSE)
                      else {
                        fit <- glmnet(x = model$x, y = draw, lambda = lambda,
                                      intercept = FALSE)
                      }
                      list(beta = fit$beta, yhat = model$x %*% fit$beta,
                           lambda = fit$lambda, df = fit$df)
                    })

ridge <- new_method("ridge", "Ridge",
                    method = function(model, draw, lambda = NULL) {
                      sv <- svd(model$x)
                      df_fun <- function(lam) {
                        # degrees of freedom when tuning param is lam
                        sum(sv$d^2 / (sv$d^2 + lam))
                      }
                      if (is.null(lambda)) {
                        nlambda <- 50
                        get_lam <- function(target_df) {
                          f <- function(lam) df_fun(lam) - target_df
                          uniroot(f, c(0, 100 * max(sv$d^2)))$root
                        }
                        lambda <- sapply(seq(1, nrow(model$x),
                                             length = nlambda), get_lam)
                      }
                      df <- sapply(lambda, df_fun)
                      beta <- sapply(lambda, function(r) {
                        d <- sv$d / (sv$d^2 + r)
                        return(sv$v %*% (d * crossprod(sv$u, draw)))
                      })
                      list(beta = beta, yhat = model$x %*% beta,
                           lambda = lambda, df = df)
                    })
sqrerr <- new_metric("sqrerr", "squared error",
                  metric = function(model, out) {
                    colMeans(as.matrix(out$beta - model$beta)^2)
                  })

best_sqrerr <- new_metric("best_sqrerr", "best squared error",
                      metric = function(model, out) {
                        min(colMeans(as.matrix(out$beta - model$beta)^2))
                      })

nnz <- new_metric("nnz", "number of nonzeros",
                  metric = function(model, out) {
                    colSums(as.matrix(out$beta) != 0)
                  })

df <- new_metric("df", "degrees of freedom",
                 metric = function(model, out) out$df)
refit <- new_method_extension(name = "refit", label = "refitted",
                              method_extension = function(model, draw, out,
                                                          base_method) {
                                beta <- apply(out$beta, 2, function(b) {
                                  ii <- b != 0
                                  if (sum(ii) == 0)
                                    return(b)
                                  xtx <- crossprod(model$x[, ii])
                                  # add small ridge in case solution has more
                                  # than n nonzeros:
                                  diag(xtx) <- diag(xtx) + 1e-4
                                  bb <- solve(xtx,
                                              crossprod(model$x[, ii], draw))
                                  b[ii] <- bb
                                  return(b)
                                })
                                return(list(beta = beta,
                                            yhat = model$x %*% beta,
                                            lambda = out$lambda,
                                            df = rep(NA, ncol(beta))))
                              })

## ---- eval = FALSE-------------------------------------------------------
#  sim <- new_simulation("bet-on-sparsity", "Bet on sparsity") %>%
#    generate_model(make_sparse_linear_model, n = 200, p = 500, snr = 2,
#                   k = as.list(seq(5, 80, by = 5)),
#                   vary_along = "k") %>%
#    simulate_from_model(nsim = 2, index = 1:2) %>%
#    run_method(list(lasso, ridge),
#               parallel = list(socket_names = 2, libraries = "glmnet")) %>%
#    evaluate(list(sqrerr, nnz, df, best_sqrerr))

## ---- echo = FALSE, results = 'hide', message = FALSE, warning = FALSE----
sim_lastmodified <- file.info("files/sim-bet-on-sparsity.Rdata")$mtime
if (is.na(sim_lastmodified) || code_lastmodified > sim_lastmodified) {
  sim <- new_simulation("bet-on-sparsity", "Bet on sparsity") %>%
    generate_model(make_sparse_linear_model, n = 200, p = 500, snr = 2,
                   k = as.list(seq(5, 80, by = 5)),
                   vary_along = "k") %>%
    simulate_from_model(nsim = 2, index = 1:2) %>%
    run_method(list(lasso, ridge),
               parallel = list(socket_names = 2, libraries = "glmnet")) %>%
    evaluate(list(sqrerr, nnz, df, best_sqrerr))
} else{
  sim <- load_simulation("bet-on-sparsity")
}

## ---- fig.width = 6, fig.height = 4, results = 'hide', warning = FALSE, message = FALSE----
plot_eval_by(sim, "best_sqrerr", varying = "k", main = "Betting on sparsity")

## ---- fig.width = 6, fig.height = 4, results = 'hide', warning = FALSE, message = FALSE----
subset_simulation(sim, k %in% c(20, 80)) %>% plot_evals("df", "sqrerr")

## ---- eval = FALSE-------------------------------------------------------
#  sim2 <- sim %>%
#    subset_simulation(methods = "lasso") %>%
#    rename("relaxing-the-lasso") %>%
#    relabel("Effect of relaxing lasso") %>%
#    run_method(methods = lasso + refit) %>%
#    evaluate(list(sqrerr, nnz, df, best_sqrerr))

## ---- echo = FALSE, results = 'hide', message = FALSE, warning = FALSE----
sim_lastmodified <- file.info("files/sim-relaxing-the-lasso.Rdata")$mtime
if (is.na(sim_lastmodified) || code_lastmodified > sim_lastmodified) {
  sim2 <- sim %>%
    subset_simulation(methods = "lasso") %>%
    rename("relaxing-the-lasso") %>%
    relabel("Effect of relaxing lasso") %>%
    run_method(methods = lasso + refit) %>%
    evaluate(list(sqrerr, nnz, df, best_sqrerr))
} else{
  sim2 <- load_simulation("relaxing-the-lasso")
}

## ---- fig.width = 6, fig.height = 4, results = 'hide', warning = FALSE, message = FALSE----
plot_eval_by(sim2, "best_sqrerr", varying = "k")

## ---- results='asis'-----------------------------------------------------
sim2 %>% 
  subset_simulation(methods = c("lasso", "lasso_refit"), subset = 1:3) %>%
  tabulate_eval(metric_name = "best_sqrerr",
                format_args = list(nsmall = 3, digits = 0),
                output_type = "markdown")

## ---- fig.width = 8, fig.height = 4, results = 'hide', warning = FALSE, message = FALSE----
subset_simulation(sim2, methods = c("lasso", "lasso_refit"), subset = 1:3) %>%
  plot_evals("nnz", "sqrerr")

## ---- fig.width = 6, fig.height = 4, results = 'hide', warning = FALSE----
subset_simulation(sim2, methods = c("lasso", "lasso_refit"), k == 40) %>%
  plot_evals("nnz", "sqrerr")

## ---- echo = FALSE, eval = TRUE, results = 'hide'------------------------
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
                                  yhat = model$x %*% out$beta[, imin])
                           })

## ---- eval = FALSE-------------------------------------------------------
#  sim3 <- sim %>% subset_simulation(methods = "") %>%
#    rename("bet-on-sparsity-cv") %>%
#    relabel("Bet on sparsity (with cross validation)") %>%
#    run_method(list(lasso + cv, ridge + cv)) %>%
#    evaluate(list(sqrerr, nnz))

## ---- echo = FALSE, results = 'hide', message = FALSE, warning = FALSE----
sim_lastmodified <- file.info("files/sim-bet-on-sparsity-cv.Rdata")$mtime
if (is.na(sim_lastmodified) || code_lastmodified > sim_lastmodified) {
  sim3 <- sim %>% subset_simulation(methods = "") %>%
    rename("bet-on-sparsity-cv") %>%
    relabel("Bet on sparsity (with cross validation)") %>%
    run_method(list(lasso + cv, ridge + cv)) %>%
    evaluate(list(sqrerr, nnz))
} else{
  sim3 <- load_simulation("bet-on-sparsity-cv")
}

## ---- fig.width = 6, fig.height = 4, results = 'hide', warning = FALSE, message = FALSE----
plot_eval_by(sim3, "sqrerr", varying = "k", main = "Betting on sparsity")

## ---- eval = FALSE-------------------------------------------------------
#  make_sparse_linear_model <- function(n, p, k, snr) {
#    x <- matrix(rnorm(n * p), n, p)
#    beta <- rep(c(1, 0), c(k, p - k))
#    mu <- as.numeric(x %*% beta)
#    sigma <- sqrt(sum(mu^2) / (n * snr)) # taking snr = ||mu||^2 / (n * sigma^2)
#    new_model(name = "slm", label = sprintf("n = %s, p = %s, k = %s", n, p, k),
#              params = list(x = x, beta = beta, mu = mu, sigma = sigma, n = n,
#                            p = p, k = k),
#              simulate = function(mu, sigma, nsim) {
#                y <- mu + sigma * matrix(rnorm(nsim * n), n, nsim)
#                return(split(y, col(y))) # make each col its own list element
#              })
#  }

## ---- eval = FALSE-------------------------------------------------------
#  library(glmnet)
#  lasso <- new_method("lasso", "Lasso",
#                      method = function(model, draw, lambda = NULL) {
#                        if (is.null(lambda))
#                          fit <- glmnet(x = model$x, y = draw, nlambda = 50,
#                                        intercept = FALSE)
#                        else {
#                          fit <- glmnet(x = model$x, y = draw, lambda = lambda,
#                                        intercept = FALSE)
#                        }
#                        list(beta = fit$beta, yhat = model$x %*% fit$beta,
#                             lambda = fit$lambda, df = fit$df)
#                      })
#  
#  ridge <- new_method("ridge", "Ridge",
#                      method = function(model, draw, lambda = NULL) {
#                        sv <- svd(model$x)
#                        df_fun <- function(lam) {
#                          # degrees of freedom when tuning param is lam
#                          sum(sv$d^2 / (sv$d^2 + lam))
#                        }
#                        if (is.null(lambda)) {
#                          nlambda <- 50
#                          get_lam <- function(target_df) {
#                            f <- function(lam) df_fun(lam) - target_df
#                            uniroot(f, c(0, 100 * max(sv$d^2)))$root
#                          }
#                          lambda <- sapply(seq(1, nrow(model$x),
#                                               length = nlambda), get_lam)
#                        }
#                        df <- sapply(lambda, df_fun)
#                        beta <- sapply(lambda, function(r) {
#                          d <- sv$d / (sv$d^2 + r)
#                          return(sv$v %*% (d * crossprod(sv$u, draw)))
#                        })
#                        list(beta = beta, yhat = model$x %*% beta,
#                             lambda = lambda, df = df)
#                      })

## ---- eval = FALSE-------------------------------------------------------
#  sqrerr <- new_metric("sqrerr", "squared error",
#                    metric = function(model, out) {
#                      colMeans(as.matrix(out$beta - model$beta)^2)
#                    })
#  
#  best_sqrerr <- new_metric("best_sqrerr", "best squared error",
#                        metric = function(model, out) {
#                          min(colMeans(as.matrix(out$beta - model$beta)^2))
#                        })
#  
#  nnz <- new_metric("nnz", "number of nonzeros",
#                    metric = function(model, out) {
#                      colSums(as.matrix(out$beta) != 0)
#                    })
#  
#  df <- new_metric("df", "degrees of freedom",
#                   metric = function(model, out) out$df)

## ---- eval = FALSE-------------------------------------------------------
#  refit <- new_method_extension(name = "refit", label = "refitted",
#                                method_extension = function(model, draw, out,
#                                                            base_method) {
#                                  beta <- apply(out$beta, 2, function(b) {
#                                    ii <- b != 0
#                                    if (sum(ii) == 0)
#                                      return(b)
#                                    xtx <- crossprod(model$x[, ii])
#                                    # add small ridge in case solution has more
#                                    # than n nonzeros:
#                                    diag(xtx) <- diag(xtx) + 1e-4
#                                    bb <- solve(xtx,
#                                                crossprod(model$x[, ii], draw))
#                                    b[ii] <- bb
#                                    return(b)
#                                  })
#                                  return(list(beta = beta,
#                                              yhat = model$x %*% beta,
#                                              lambda = out$lambda,
#                                              df = rep(NA, ncol(beta))))
#                                })

## ------------------------------------------------------------------------
lasso + refit

## ---- eval = FALSE-------------------------------------------------------
#  relaxed_mcp <- mcp + refit

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
#                                    yhat = model$x %*% out$beta[, imin])
#                             })

