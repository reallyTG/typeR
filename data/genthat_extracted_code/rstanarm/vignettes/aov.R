params <-
list(EVAL = FALSE)

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

## ----aov-weightgain-aov--------------------------------------------------
#  data("weightgain", package = "HSAUR3")
#  coef(aov(weightgain ~ source * type, data = weightgain))

## ----aov-weightgain-mcmc, results="hide"---------------------------------
#  library(rstanarm)
#  post1 <- stan_aov(weightgain ~ source * type, data = weightgain,
#                    prior = R2(location = 0.5), adapt_delta = 0.999,
#                    chains = CHAINS, cores = CORES, seed = SEED)
#  post1

## ---- echo=FALSE---------------------------------------------------------
#  print(post1)

## ---- aov-weightgain-stan_lmer, eval=FALSE-------------------------------
#  post2 <- stan_lmer(weightgain ~ 1 + (1|source) + (1|type) + (1|source:type),
#                     data = weightgain, prior_intercept = cauchy(),
#                     prior_covariance = decov(shape = 2, scale = 2),
#                     adapt_delta = 0.999, chains = CHAINS, cores = CORES,
#                     seed = SEED)

