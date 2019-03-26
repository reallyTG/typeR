## ----setup, include=FALSE------------------------------------------------
library(knitr)
code <- file.path("false-discovery-rate",
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
make_correlated_pvalues <- function(n, pi0, rho) {
  # Gaussian copula model...
  #
  # n pvalues, the first n*pi0 of which are null, coming from a multivariate
  # normal with all correlations rho.
  sigma <- matrix(rho, n, n)
  diag(sigma) <- 1
  n0 <- round(n * pi0)
  delta <- 2 # size of signal
  mu <- rep(c(0, delta), c(n0, n - n0)) # n0 are null
  new_model(name = "correlated-pvalues",
            label = sprintf("pi0 = %s, rho = %s", pi0, rho),
            params = list(n = n, rho = rho, sigma = sigma,
                          pi0 = pi0, mu = mu, delta = delta,
                          nonnull = which(mu != 0)),
            simulate = function(n, mu, sigma, nsim) {
              # this function must return a list of length nsim
              x <- rmvnorm(nsim, mean = mu, sigma = sigma)
              pvals <- 1 - pnorm(x)
              return(split(pvals, row(pvals))) # make each row its own list element
            })
}
make_bh <- function(q) {
  # q is the desired level of control for the FDR
  new_method(name = paste0("bh", q),
             label = sprintf("BH (q = %s)", q),
             settings = list(q = q),
             method = function(model, draw, q) {
               p <- sort(draw)
               cutline <- seq(model$n) * q / model$n
               threshold <- max(p[p <= cutline], 0)
               list(rejected = which(draw <= threshold))
             })
}

qvalues <- c(0.05, 0.1, 0.2)
bh_methods <- sapply(qvalues, make_bh)
fdp <- new_metric(name = "fdp",
                  label = "false discovery proportion",
                  metric = function(model, out) {
                    fp <- setdiff(out$rejected, model$nonnull)
                    nd <- max(length(out$rejected), 1)
                    return(length(fp) / nd)
                    })

nd <- new_metric(name = "nd",
                 label = "number of discoveries",
                 metric = function(model, out) length(out$rejected))

## ---- eval = FALSE-------------------------------------------------------
#  name_of_simulation <- "fdr"
#  sim <- new_simulation(name = name_of_simulation,
#                        label = "False Discovery Rate") %>%
#    generate_model(make_correlated_pvalues, seed = 123,
#                   n = 20,
#                   pi0 = list(0.8, 1),
#                   rho = list(-0.01, 0, 0.1, 0.9),
#                   vary_along = c("pi0", "rho")) %>%
#    simulate_from_model(nsim = 25, index = 1:4) %>%
#    run_method(bh_methods, parallel = list(socket_names = 2)) %>%
#    evaluate(list(fdp, nd))

## ---- echo = FALSE, results = 'hide', message = FALSE, warning = FALSE----
name_of_simulation <- "fdr"
sim_lastmodified <- file.info(sprintf("files/sim-%s.Rdata",
                              name_of_simulation))$mtime
if (is.na(sim_lastmodified) || code_lastmodified > sim_lastmodified) {
  sim <- new_simulation(name = name_of_simulation,
                        label = "False Discovery Rate") %>%
    generate_model(make_correlated_pvalues, seed = 123,
                   n = 20,
                   pi0 = list(0.8, 1),
                   rho = list(-0.01, 0, 0.1, 0.9),
                   vary_along = c("pi0", "rho")) %>%
    simulate_from_model(nsim = 25, index = 1:4) %>%
    run_method(bh_methods, parallel = list(socket_names = 2)) %>%
    evaluate(list(fdp, nd))
  sim <- sim %>%
    simulate_from_model(nsim = 25, index = 5:8) %>%
    run_method(bh_methods, parallel = list(socket_names = 2)) %>%
    evaluate(list(fdp, nd))
}
sim <- load_simulation(name_of_simulation) %>% subset_simulation(index = 1:4)

## ---- results = 'asis'---------------------------------------------------
sim %>% 
  subset_simulation(rho == 0) %>% 
  tabulate_eval(metric_name = "fdp", output_type = "html", 
                format_args = list(digits = 0, nsmall = 2))

## ---- eval = FALSE-------------------------------------------------------
#  sim <- load_simulation("fdr")

## ---- eval = FALSE-------------------------------------------------------
#  sim <- sim %>%
#    simulate_from_model(nsim = 25, index = 5:8) %>%
#    run_method(bh_methods, parallel = list(socket_names = 2)) %>%
#    evaluate(list(fdp, nd))

## ---- echo = FALSE, results = 'hide', message = FALSE, warning = FALSE----
sim <- load_simulation("fdr") # load the one with index = 1:8

## ---- results = 'asis'---------------------------------------------------
sim %>% 
  subset_simulation(rho == 0) %>% 
  tabulate_eval(metric_name = "fdp", output_type = "html", 
                format_args = list(digits = 0, nsmall = 2))

## ---- fig.width = 6, fig.height = 4, results = 'hide', warning = FALSE, message = FALSE----
sim %>% 
  subset_simulation(rho == 0) %>% 
plot_eval(metric_name = "fdp")

## ---- fig.width = 6, fig.height = 4, results = 'hide', warning = FALSE, message = FALSE----
sim %>% 
  subset_simulation(pi0 == 0.8) %>% 
plot_eval(metric_name = "fdp", varying = "rho")

## ---- fig.width = 6, fig.height = 4, results = 'hide', warning = FALSE, message = FALSE----
sim %>% 
  subset_simulation(pi0 == 0.8) %>% 
plot_eval_by(metric_name = "fdp", varying = "rho")

## ---- fig.width = 6, fig.height = 4, results = 'hide', warning = FALSE, message = FALSE----
sim %>% 
  subset_simulation(pi0 == 1) %>% 
plot_eval_by(metric_name = "fdp", varying = "rho")

## ---- eval = FALSE-------------------------------------------------------
#  sim2 <- subset_simulation(sim, pi0 == 1 & rho == -0.01) %>%
#    rename("fdr-negdep") %>%
#    relabel("BH Procedure under negative dependence") %>%
#    simulate_from_model(nsim = 25, index = 9:20) %>%
#    run_method(bh_methods, parallel = list(socket_names = 2)) %>%
#    evaluate(list(fdp, nd))

## ---- echo = FALSE, results = 'hide', message = FALSE, warning = FALSE----
sim_lastmodified <- file.info(sprintf("files/sim-%s.Rdata",
                              "negdep"))$mtime
if (is.na(sim_lastmodified) || code_lastmodified > sim_lastmodified) {
  sim2 <- subset_simulation(sim, pi0 == 1 & rho == -0.01) %>%
    rename("fdr-negdep") %>%
    relabel("BH Procedure under negative dependence") %>%
    simulate_from_model(nsim = 25, index = 9:20) %>%
    run_method(bh_methods, parallel = list(socket_names = 2)) %>%
    evaluate(list(fdp, nd))
} else{
  sim2 <- load_simulation("negdep")
}

## ---- results = 'asis'---------------------------------------------------
tabulate_eval(sim2, metric_name = "fdp", output_type = "html", 
                format_args = list(digits = 0, nsmall = 2))

## ------------------------------------------------------------------------
m <- model(sim, pi0 == 1 & rho == -0.01)
m2 <- model(sim2)
all.equal(m, m2)
d <- draws(sim, pi0 == 1 & rho == -0.01)
d2 <- draws(sim2, index = 1:8)
all.equal(d, d2)

## ---- eval = FALSE-------------------------------------------------------
#  library(mvtnorm)
#  make_correlated_pvalues <- function(n, pi0, rho) {
#    # Gaussian copula model...
#    #
#    # n pvalues, the first n*pi0 of which are null, coming from a multivariate
#    # normal with all correlations rho.
#    sigma <- matrix(rho, n, n)
#    diag(sigma) <- 1
#    n0 <- round(n * pi0)
#    delta <- 2 # size of signal
#    mu <- rep(c(0, delta), c(n0, n - n0)) # n0 are null
#    new_model(name = "correlated-pvalues",
#              label = sprintf("pi0 = %s, rho = %s", pi0, rho),
#              params = list(n = n, rho = rho, sigma = sigma,
#                            pi0 = pi0, mu = mu, delta = delta,
#                            nonnull = which(mu != 0)),
#              simulate = function(n, mu, sigma, nsim) {
#                # this function must return a list of length nsim
#                x <- rmvnorm(nsim, mean = mu, sigma = sigma)
#                pvals <- 1 - pnorm(x)
#                return(split(pvals, row(pvals))) # make each row its own list element
#              })
#  }

## ---- eval = FALSE-------------------------------------------------------
#  make_bh <- function(q) {
#    # q is the desired level of control for the FDR
#    new_method(name = paste0("bh", q),
#               label = sprintf("BH (q = %s)", q),
#               settings = list(q = q),
#               method = function(model, draw, q) {
#                 p <- sort(draw)
#                 cutline <- seq(model$n) * q / model$n
#                 threshold <- max(p[p <= cutline], 0)
#                 list(rejected = which(draw <= threshold))
#               })
#  }
#  
#  qvalues <- c(0.05, 0.1, 0.2)
#  bh_methods <- sapply(qvalues, make_bh)

## ---- eval = FALSE-------------------------------------------------------
#  fdp <- new_metric(name = "fdp",
#                    label = "false discovery proportion",
#                    metric = function(model, out) {
#                      fp <- setdiff(out$rejected, model$nonnull)
#                      nd <- max(length(out$rejected), 1)
#                      return(length(fp) / nd)
#                      })
#  
#  nd <- new_metric(name = "nd",
#                   label = "number of discoveries",
#                   metric = function(model, out) length(out$rejected))

## ---- results='asis'-----------------------------------------------------
citation("simulator")

