## ----setup, include=FALSE------------------------------------------------
library(knitr)
code <- file.path("james-stein",
                  c("model_functions.R", 
                    "method_functions.R",
                    "eval_functions.R", 
                    "main.R"))
sapply(code, read_chunk)

## ------------------------------------------------------------------------
library(simulator)

## ------------------------------------------------------------------------
make_normal_model <- function(theta_norm, p) {
  new_model(name = "norm",
            label = sprintf("p = %s, theta_norm = %s", p, theta_norm),
            params = list(theta_norm = theta_norm, p = p,
                          theta = c(theta_norm, rep(0, p - 1))),
            simulate = function(theta, p, nsim) {
              Y <- theta + matrix(rnorm(nsim * p), p, nsim)
              return(split(Y, col(Y))) # make each col its own list element
            })
}

## ------------------------------------------------------------------------
mle <- new_method(name = "mle", label = "MLE",
                  method = function(model, draw) return(list(est = draw)))

js <- new_method(name = "jse", label = "James-Stein",
                 method = function(model, draw) {
                   l2 <- sum(draw^2)
                   return(list(est = (1 - (model$p - 2) / l2) * draw))
                 })

## ------------------------------------------------------------------------
sqr_err <- new_metric(name = "sqrerr", label = "Squared Error Loss",
                      metric = function(model, out) {
                        mean((out$est - model$theta)^2)
                      })

## ------------------------------------------------------------------------
sim1 <- new_simulation(name = "js-v-mle",
                       label = "Investigating the James-Stein Estimator") %>%
  generate_model(make_normal_model, theta_norm = 1, p = list(2, 6),
                 vary_along = "p", seed = 123) %>%
  simulate_from_model(nsim = 20) %>%
  run_method(list(js, mle)) %>%
  evaluate(sqr_err)

## ---- fig.width=6, fig.height=4------------------------------------------
plot_eval(sim1, metric_name = "sqrerr")

## ---- results="asis"-----------------------------------------------------
tabulate_eval(sim1, metric_name = "sqrerr", output_type = "markdown")

## ---- results="asis"-----------------------------------------------------
tabulate_eval(sim1, metric_name = "sqrerr", output_type = "markdown",
              format_args = list(nsmall = 1, digits = 0))

## ---- results="hide"-----------------------------------------------------
sim2 <- new_simulation(name = "js-v-mle2",
                       label = "Investigating James-Stein Estimator") %>%
  generate_model(make_normal_model, vary_along = "p",
                 theta_norm = 1, p = as.list(seq(1, 30, by = 5))) %>%
  simulate_from_model(nsim = 20) %>%
  run_method(list(js, mle)) %>%
  evaluate(sqr_err)

## ---- fig.width=6, fig.height=5------------------------------------------
plot_eval(sim2, metric_name = "sqrerr")

## ---- results="asis"-----------------------------------------------------
tabulate_eval(sim2, metric_name = "sqrerr", output_type = "markdown",
              format_args = list(nsmall = 2, digits = 1))

## ---- fig.width=6, fig.height=4, results="hide"--------------------------
plot_eval_by(sim2, metric_name = "sqrerr", varying = "p")

## ---- fig.width=6, fig.height=5------------------------------------------
plot_eval_by(sim2, metric_name = "sqrerr", varying = "p", use_ggplot2 = FALSE)

## ------------------------------------------------------------------------
df <- as.data.frame(evals(sim2))
head(df)

## ------------------------------------------------------------------------
evals(sim2, p == 6, methods = "jse") %>% as.data.frame %>% head

## ---- results="hide"-----------------------------------------------------
sim3 <- new_simulation(name = "js-v-mle3",
                       label = "Investigating the James-Stein Estimator") %>%
  generate_model(make_normal_model, vary_along = c("p", "theta_norm"),
                 theta_norm = as.list(round(seq(0, 5, length = 10), 2)),
                 p = as.list(seq(1, 30, by = 10))) %>%
  simulate_from_model(nsim = 20) %>%
  run_method(list(js, mle)) %>%
  evaluate(sqr_err)

## ---- fig.width=6, fig.height=4, results="hide"--------------------------
subset_simulation(sim3, p == 11) %>% 
  plot_eval_by(metric_name = "sqrerr", varying = "theta_norm", main = "p = 11")

## ---- fig.width=6, fig.height=4, results="hide"--------------------------
subset_simulation(sim3, p == 1) %>% 
  plot_eval_by(metric_name = "sqrerr", varying = "theta_norm", main = "p = 1")

## ---- fig.width=6, fig.height=4, results="hide"--------------------------
subset_simulation(sim3, p == 1) %>% 
  plot_eval_by(metric_name = "sqrerr", varying = "theta_norm", 
               type = "raw", main = "p = 1")

## ------------------------------------------------------------------------
m <- model(sim3, p == 1 & theta_norm == 0)
m

## ------------------------------------------------------------------------
m$theta

## ------------------------------------------------------------------------
d <- draws(sim3, p == 1 & theta_norm == 0)
d
d@draws[1:4] # this is a list, one per draw of Y.  Look at first 4 elements.
summary(unlist(d@draws))

## ------------------------------------------------------------------------
e <- evals(sim3, p == 1 & theta_norm == 0, methods = "jse")
e
df <- as.data.frame(e)
summary(df$sqrerr)
df[which.max(df$sqrerr), ]

## ------------------------------------------------------------------------
o <- output(sim3, p == 1 & theta_norm == 0, methods = "jse")
o@out$r1.14

## ------------------------------------------------------------------------
d@draws$r1.14

## ------------------------------------------------------------------------
1-(m$p - 2)/d@draws$r1.14^2

