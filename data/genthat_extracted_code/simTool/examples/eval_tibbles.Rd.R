library(simTool)


### Name: eval_tibbles
### Title: Workhorse for simulation studies
### Aliases: eval_tibbles

### ** Examples

rng = function(data, ...) {
ret = range(data)
names(ret) = c("min", "max")
ret
}

dg <- expand_tibble(fun = "rnorm", n = c(5L, 10L))
pg <- expand_tibble(proc = c("rng", "median", "length"))

eval_tibbles(dg, pg,rep = 2, simplify=FALSE)
eval_tibbles(dg, pg,rep = 2)
eval_tibbles(dg, pg,rep = 2, post_analyze = purrr::compose(tibble::as_tibble, t, identity))
# Note, identity in the post_analyze-parameter is a workaround for a bug that was 
# introduced in purrr 0.3.0, see https://github.com/tidyverse/purrr/issues/629
eval_tibbles(dg, pg,rep = 2, summary_fun = list(mean = mean, sd = sd))

regData = function(n, SD){
  data.frame(
  x=seq(0,1,length=n),
  y=rnorm(n, sd=SD))
}

eg <- eval_tibbles(
  expand_tibble(fun="regData", n=5L, SD=1:2),
  expand_tibble(proc="lm", formula=c("y~x", "y~I(x^2)")),
  group_for_summary = "term",
  replications=3
)
eg

presever_rownames = function(mat)
{
  rn = rownames(mat)
  ret = tibble::as_tibble(mat)
  ret$term = rn
  ret
}

eg <- eval_tibbles(
  expand_tibble(fun="regData", n=5L, SD=1:2),
  expand_tibble(proc="lm", formula=c("y~x", "y~I(x^2)")),
  post_analyze = purrr::compose(presever_rownames, coef, summary, identity),
  #post_analyze = broom::tidy, # is a nice out of the box alternative
  summary_fun = list(mean = mean, sd = sd),
  group_for_summary = "term",
  replications=3
)
# Note, identity in the post_analyze-parameter is a workaround for a bug that was 
# introduced in purrr 0.3.0, see https://github.com/tidyverse/purrr/issues/629
tidyr::unnest(eg$simulation)

dg <- expand_tibble(fun = "rexp", rate = c(10, 100), n = c(50L, 100L)) 
pg <- expand_tibble(proc = c("t.test"), conf.level = c(0.8, 0.9, 0.95))
et <- eval_tibbles(dg, pg,
  ncpus = 1,
  replications = 10^1,
  post_analyze = function(ttest, .truth) {
    mu = 1 / .truth$rate
    ttest$conf.int[1] <= mu && mu <= ttest$conf.int[2]
  },
 summary_fun = list(mean = mean, sd = sd)
)
et

dg <- dplyr::bind_rows(
 expand_tibble(fun = "rexp", rate = 10, .truth = 1/10, n = c(50L, 100L)),
 expand_tibble(fun = "rnorm", .truth = 0, n = c(50L, 100L)))
pg <- expand_tibble(proc = c("t.test"), conf.level = c(0.8, 0.9, 0.95))
et <- eval_tibbles(dg, pg,
  ncpus = 1,
  replications = 10^1,
  post_analyze = function(ttest, .truth) {
    ttest$conf.int[1] <= .truth && .truth <= ttest$conf.int[2]
  },
  summary_fun = list(mean = mean, sd = sd)
)
et



