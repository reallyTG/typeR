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

## ----lm-clouds-ols-------------------------------------------------------
#  data("clouds", package = "HSAUR3")
#  ols <- lm(rainfall ~ seeding * (sne + cloudcover + prewetness + echomotion) +
#              time, data = clouds)
#  round(coef(ols), 3)

## ----lm-clouds-mcmc, results='hide'--------------------------------------
#  library(rstanarm)
#  post <- stan_lm(rainfall ~ seeding * (sne + cloudcover + prewetness +
#                                          echomotion) + time, data = clouds,
#                  prior = R2(location = 0.2),
#                  chains = CHAINS, cores = CORES, seed = SEED)
#  post

## ---- echo=FALSE---------------------------------------------------------
#  print(post)

## ----lm-clouds-ate-plot--------------------------------------------------
#  clouds_cf <- clouds
#  clouds_cf$seeding[] <- "yes"
#  y1_rep <- posterior_predict(post, newdata = clouds_cf)
#  clouds_cf$seeding[] <- "no"
#  y0_rep <- posterior_predict(post, newdata = clouds_cf)
#  qplot(x = c(y1_rep - y0_rep), geom = "histogram", xlab = "Estimated ATE")

## ----lm-clouds-simple, results="hide"------------------------------------
#  simple <- stan_glm(rainfall ~ seeding * (sne + cloudcover + prewetness +
#                                          echomotion) + time,
#                     data = clouds, family = gaussian(),
#                     prior = cauchy(), prior_intercept = cauchy(),
#                     chains = CHAINS, cores = CORES, seed = SEED)

## ----lm-clouds-loo, warning=TRUE-----------------------------------------
#  (loo_post <- loo(post))
#  compare_models(loo_post, loo(simple))

## ----lm-clouds-plot-loo--------------------------------------------------
#  plot(loo_post, label_points = TRUE)

