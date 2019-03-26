## ---- echo = FALSE, message = FALSE---------------------------------------------------------------
knitr::opts_chunk$set(comment = "")
options(width = 100, max.print = 100)
set.seed(123456)
library(simTool)
library(dplyr)
library(tidyr)
library(tibble)
library(ggplot2)
library(broom)
library(boot)

## -------------------------------------------------------------------------------------------------
regData <- function(n, SD) {
  x <- seq(0, 1, length = n)
  y <- 10 + 2 * x + rnorm(n, sd = SD)
  tibble(x = x, y = y)
}

eval_tibbles(
  expand_tibble(fun = "regData", n = 5L, SD = 1:2),
  expand_tibble(proc = "lm", formula = c("y~x", "y~I(x^2)")),
  post_analyze = broom::tidy,
  summary_fun = list(mean = mean, sd = sd),
  group_for_summary = "term",
  replications = 3
)

## -------------------------------------------------------------------------------------------------
print(dg <- dplyr::bind_rows(
  expand_tibble(fun = "rexp", n = c(10L, 20L), rate = 1:2),
  expand_tibble(fun = "rnorm", n = c(10L, 20L), mean = 1:2)
))

## -------------------------------------------------------------------------------------------------
print(pg <- dplyr::bind_rows(
  expand_tibble(proc = "min"),
  expand_tibble(proc = "mean", trim = c(0.1, 0.2))
))

## ---- eval=FALSE----------------------------------------------------------------------------------
#  1.  convert dg to R-functions  {g_1, ..., g_k}
#  2.  convert pg to R-functions  {f_1, ..., f_L}
#  3.  initialize result object
#  4.  append dg and pg to the result object
#  5.  t1 = current.time()
#  6.  for g in  {g_1, ..., g_k}
#  7.      for r in 1:replications (optionally in a parallel manner)
#  8.          data = g()
#  9.          for f in  {f_1, \ldots, f_L}
#  10.             append f(data) to the result object (optionally apply a post-analyze-function)
#  11.         optionally append data to the result object
#  12.      optionally summarize the result object over all
#           replications but separately for f_1, ..., f_L (and optional group variables)
#  13. t2 = current.time()
#  14. Estimate the number of replications per hour from t1 and t2

## -------------------------------------------------------------------------------------------------
dg <- expand_tibble(fun = "rnorm", n = 10, mean = 1:2)
pg <- expand_tibble(proc = "min")
eg <- eval_tibbles(data_grid = dg, proc_grid = pg, replications = 2)
eg

## -------------------------------------------------------------------------------------------------
eg <- eval_tibbles(data_grid = dg, proc_grid = pg, replications = 3)
eg

## -------------------------------------------------------------------------------------------------
eg <- eval_tibbles(data_grid = dg, proc_grid = pg, replications = 1)
eg$simulation
eg$generated_data

## -------------------------------------------------------------------------------------------------
dg <- expand_tibble(fun = "runif", n = c(10, 20, 30))
pg <- expand_tibble(proc = c("min", "max"))
eval_tibbles(
  data_grid = dg, proc_grid = pg, replications = 1000,
  summary_fun = list(mean = mean)
)
eval_tibbles(
  data_grid = dg, proc_grid = pg, replications = 1000,
  summary_fun = list(mean = mean, sd = sd)
)

## -------------------------------------------------------------------------------------------------
eval_tibbles(
  expand_tibble(fun = "regData", n = 5L, SD = 1:2),
  expand_tibble(proc = "lm", formula = c("y~x", "y~I(x^2)")),
  replications = 2
)

## -------------------------------------------------------------------------------------------------
eval_tibbles(
  expand_tibble(fun = "regData", n = 5L, SD = 1:2),
  expand_tibble(proc = "lm", formula = c("y~x", "y~I(x^2)")),
  post_analyze = purrr::compose(function(mat) mat["(Intercept)", "Estimate"], coef, summary.lm, identity),
  replications = 2
)

## -------------------------------------------------------------------------------------------------
presever_rownames <- function(mat) {
  rn <- rownames(mat)
  ret <- tibble::as_tibble(mat)
  ret$term <- rn
  ret
}

eval_tibbles(
  expandGrid(fun = "regData", n = 5L, SD = 1:2),
  expandGrid(proc = "lm", formula = c("y~x", "y~I(x^2)")),
  post_analyze = purrr::compose(presever_rownames, coef, summary, identity),
  replications = 3
)

## -------------------------------------------------------------------------------------------------
eval_tibbles(
  expandGrid(fun = "regData", n = 5L, SD = 1:2),
  expandGrid(proc = "lm", formula = c("y~x", "y~I(x^2)")),
  post_analyze = purrr::compose(presever_rownames, coef, summary, identity),
  summary_fun = list(mean = mean, sd = sd),
  group_for_summary = "term",
  replications = 3
)

## -------------------------------------------------------------------------------------------------
eval_tibbles(
  data_grid = dg, proc_grid = pg, replications = 10,
  ncpus = 2, summary_fun = list(mean = mean)
)

## -------------------------------------------------------------------------------------------------
library(parallel)
cl <- makeCluster(rep("localhost", 2), type = "PSOCK")
eval_tibbles(
  data_grid = dg, proc_grid = pg, replications = 10,
  cluster = cl, summary_fun = list(mean = mean)
)
stopCluster(cl)

## -------------------------------------------------------------------------------------------------
library(boot)
ratio <- function(d, w) sum(d$x * w) / sum(d$u * w)
city.boot <- boot(city, ratio,
  R = 999, stype = "w",
  sim = "ordinary"
)
boot.ci(city.boot,
  conf = c(0.90, 0.95),
  type = c("norm", "basic", "perc", "bca")
)

## -------------------------------------------------------------------------------------------------
returnCity <- function() {
  city
}
bootConfInt <- function(data) {
  city.boot <- boot(data, ratio,
    R = 999, stype = "w",
    sim = "ordinary"
  )
  boot.ci(city.boot,
    conf = c(0.90, 0.95),
    type = c("norm", "basic", "perc", "bca")
  )
}

## -------------------------------------------------------------------------------------------------
dg <- expand_tibble(fun = "returnCity")
pg <- expand_tibble(proc = "bootConfInt")
eval_tibbles(dg, pg,
  replications = 10, ncpus = 2,
  cluster_libraries = c("boot"),
  cluster_global_objects = c("ratio")
)

## -------------------------------------------------------------------------------------------------
# masking summary from the base package
summary <- function(x) tibble(sd = sd(x))
g <- function(x) tibble(q0.1 = quantile(x, 0.1))
someFunc <- function() {
  summary <- function(x) tibble(sd = sd(x), mean = mean(x))

  dg <- expand_tibble(fun = "runif", n = 100)
  pg <- expand_tibble(proc = c("summary", "g"))

  # the standard is to use the global
  # environment, hence summary defined outside
  # of someFunc() will be used
  print(eval_tibbles(dg, pg))
  cat("--------------------------------------------------\n")
  # will use the local defined summary, but g
  # from the global environment, because
  # g is not locally defined.
  print(eval_tibbles(dg, pg, envir = environment()))
}
someFunc()

## -------------------------------------------------------------------------------------------------
dg <- expand_tibble(fun = c("rnorm"), mean = c(1,1000), sd = c(1,10), n = c(10L, 100L))
pg <- expand_tibble(proc = "quantile", probs = 0.975)
post_ana <- function(q_est, .truth){
  tibble::tibble(bias = q_est - stats::qnorm(0.975, mean = .truth$mean, sd = .truth$sd))
}
eval_tibbles(dg, pg, replications = 10^3, discard_generated_data = TRUE,
                   ncpus = 2,
                   post_analyze = post_ana,
                   summary_fun = list(mean = mean))

## -------------------------------------------------------------------------------------------------
dg <- dplyr::bind_rows(
  expand_tibble(fun = c("rnorm"), mean = 0, n = c(10L, 100L), .truth = qnorm(0.975)),
  expand_tibble(fun = c("rexp"), rate = 1, n = c(10L, 100L), .truth = qexp(0.975, rate = 1)),
  expand_tibble(fun = c("runif"), max = 2, n = c(10L, 100L), .truth = qunif(0.975, max = 2))
)
pg <- expand_tibble(proc = "quantile", probs = 0.975)
post_ana <- function(q_est, .truth){
  ret <- q_est - .truth
  names(ret) <- "bias"
  ret
}
eval_tibbles(dg, pg, replications = 10^3, discard_generated_data = TRUE,
                   ncpus = 2,
                   post_analyze = post_ana,
                   summary_fun = list(mean = mean))

## -------------------------------------------------------------------------------------------------
dg <- dplyr::bind_rows(
  expand_tibble(fun = c("rnorm"), mean = 0, n = c(10L, 1000L), 
                .truth = list(function(prob) qnorm(prob, mean = 0))),
  expand_tibble(fun = c("rexp"), rate = 1, n = c(10L, 1000L),
                .truth = list(function(prob) qexp(prob, rate = 1))),
  expand_tibble(fun = c("runif"), max = 2, n = c(10L, 1000L),
                .truth = list(function(prob) qunif(prob, max = 2)))
)
bias_quantile <- function(x, prob, .truth) {
  est <- quantile(x, probs = prob)
  ret <- est - .truth[[1]](prob)
  names(ret) <- "bias"
  ret
}
pg <- expand_tibble(proc = "bias_quantile", prob = c(0.9, 0.975))
eval_tibbles(dg, pg, replications = 10^3, discard_generated_data = TRUE,
                   ncpus = 1,
                   summary_fun = list(mean = mean))

## ---- eval = FALSE--------------------------------------------------------------------------------
#  6.  for g in  {g_1, ..., g_k}
#  7.      for r in 1:replications (optionally in a parallel manner)
#  8.          data = g()
#  9.          for f in  {f_1, \ldots, f_L}
#  10.             append f(data) to the result object (optionally apply a post-analyze-function)

## -------------------------------------------------------------------------------------------------
EVAL <- FALSE
if (Sys.getenv("NOT_CRAN") == "true") {
  EVAL <- TRUE
}

## ---- eval = EVAL---------------------------------------------------------------------------------
dg <- dplyr::bind_rows(
  expand_tibble(fun = c("rnorm"), mean = 1, n = c(10L, 100L)),
  expand_tibble(fun = c("rexp"), rate = 1, n = c(10L, 100L))
)
dg

## ---- eval = EVAL---------------------------------------------------------------------------------
pg <- expand_tibble(proc = c("mean", "median"))
pg

## ---- eval = EVAL---------------------------------------------------------------------------------
et <- eval_tibbles(dg, pg, replications = 10^5, ncpus = 2)
et
et$simulation %>%
  ggplot(aes(x = results, color = interaction(fun, n), fill = interaction(fun, n))) +
  geom_density(alpha = 0.3) +
  facet_wrap(~ proc)

## ---- eval = EVAL---------------------------------------------------------------------------------
bootstrap_ci <- function(x, conf.level, R = 999) {
  b <- boot::boot(x, function(d, i) {
    n <- length(i)
    c(
      mean = mean(d[i]),
      variance = (n - 1) * var(d[i]) / n^2
    )
  }, R = R)
  boot::boot.ci(b, conf = conf.level, type = "all")
}

## ---- eval = EVAL---------------------------------------------------------------------------------
post_analyze <- function(o, .truth) {
  if (class(o) == "htest") {
  #post-process the object returned by t.test
    ci <- o$conf.int
    return(tibble::tibble(
      type = "t.test",
      aspect = c("covered", "ci_length"),
      value = c(ci[1] <= .truth && .truth <= ci[2], ci[2] - ci[1])
    ))
  } else if (class(o) == "bootci") {
  #post-process the object returned by boot.ci
    method = c("normal", "basic", "student", "percent", "bca")
    ret = o[method]
    lower = unlist(purrr::map(ret, ~dplyr::nth(.x, -2)))
    upper = sapply(ret, dplyr::last)
    type = paste("boot", method, sep = "_")

    return(
      dplyr::bind_rows(
      tibble::tibble(
        type = type, 
        aspect = "covered", 
        value = as.integer(lower <= .truth & .truth <= upper)),
      tibble::tibble(
        type = type, 
        aspect = "ci_length", 
        value = upper - lower))
    )
  }
}

## ---- eval = EVAL---------------------------------------------------------------------------------
dg <- dplyr::bind_rows(
  simTool::expand_tibble(fun = "rnorm", n = 10L, mean = 0, sd = sqrt(3), .truth = 0),
  simTool::expand_tibble(fun = "runif", n = 10L, max = 6, .truth = 3),
  simTool::expand_tibble(fun = "rexp", n = 10L, rate = 1 / sqrt(3), .truth = sqrt(3))
)
dg

## ---- eval = EVAL---------------------------------------------------------------------------------
pg <- simTool::expand_tibble(
  proc = c("t.test","bootstrap_ci"),
  conf.level = c(0.9, 0.95)
)
pg

## ---- eval = EVAL---------------------------------------------------------------------------------
et <- eval_tibbles(dg, pg,
  replications = 10^3, ncpus = 2,
  cluster_global_objects = "post_analyze",
  post_analyze = post_analyze,
  summary_fun = list(mean = mean),
  group_for_summary = c("aspect", "type")
)
et

## ---- eval = EVAL, fig.width=13-------------------------------------------------------------------
et$simulation %>%
  ggplot(aes(x = fun, y = value, group = type, fill = type, label = round(value, 2))) +
  geom_col(position = "dodge") +
  geom_label(position = position_dodge(0.9), size = 3) +
  theme(legend.position = "bottom") + 
  facet_grid(aspect ~ conf.level, scales = "free")

## ---- eval = EVAL---------------------------------------------------------------------------------
t_test = function(x, conf.level){
  tt <- t.test(x, conf.level = conf.level)
  
  # unify return
  tibble::tibble(type = "t.test", lower = tt$conf.int[1], upper = tt$conf.int[2])
}

bootstrap_ci <- function(x, conf.level, R = 999) {
  b <- boot::boot(x, function(d, i) {
    n <- length(i)
    c(
      mean = mean(d[i]),
      variance = (n - 1) * var(d[i]) / n^2
    )
  }, R = R)
  ci <- boot::boot.ci(b, conf = conf.level, type = "all")
  method = c("normal", "basic", "student", "percent", "bca")
  ret = ci[method]
  lower = unlist(purrr::map(ret, ~dplyr::nth(.x, -2)))
  upper = sapply(ret, dplyr::last)
  type = paste("boot", method, sep = "_")
  
  # unify return
  tibble::tibble(type = type, lower = lower, upper = upper)
}

dg <- dplyr::bind_rows(
  simTool::expand_tibble(fun = "rnorm", n = 10L, mean = 0, sd = sqrt(3), .truth = 0),
  simTool::expand_tibble(fun = "runif", n = 10L, max = 6, .truth = 3),
  simTool::expand_tibble(fun = "rexp", n = 10L, rate = 1 / sqrt(3), .truth = sqrt(3))
)

pg <- simTool::expand_tibble(
  proc = c("t_test","bootstrap_ci"),
  conf.level = c(0.9, 0.95)
) %>% 
  mutate(R = ifelse(proc == "bootstrap_ci", 100, NA))

et <- eval_tibbles(dg, pg,
  replications = 10^2, ncpus = 2
)
et

## ---- eval = EVAL---------------------------------------------------------------------------------
grps <- et$simulation %>% 
  select(-replications) %>% 
  select(fun:type) %>% 
  names

et$simulation %>% 
  mutate(covered = lower <= .truth & .truth <= upper,
         ci_length = upper - lower) %>% 
  group_by_(.dots = grps) %>% 
  summarise(coverage = mean(covered),
            ci_length = mean(ci_length))

