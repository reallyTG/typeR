## ----setup, include=FALSE------------------------------------------------
knitr::opts_chunk$set(echo = TRUE)

## ------------------------------------------------------------------------
library(mvord)

## ------------------------------------------------------------------------
data("data_cr")
str(data_cr, vec.len = 3)
head(data_cr, n = 3)

## ----eval = FALSE--------------------------------------------------------
#  res_cor_probit_2raters <- mvord(formula = MMO2(rater1, rater2) ~ 0 + LR + LEV + PR + RSIZE + BETA,
#                                 threshold.constraints = c(1, 1),
#                                 data = data_cr)

## ----echo = FALSE, results = 'hide', eval = TRUE-------------------------
cache <- TRUE
FILE <- "res_cor_probit_2raters.rda"
if (cache & file.exists(FILE)) {
  load(FILE)
} else {
  if (cache) {
res_cor_probit_2raters <- mvord(formula = MMO2(rater1, rater2) ~ 0 + LR + LEV + PR + RSIZE + BETA,
                               threshold.constraints = c(1, 1),
                               data = data_cr)
res_cor_probit_2raters <- mvord:::reduce_size.mvord(res_cor_probit_2raters)
  save(res_cor_probit_2raters, file  = FILE)
  } else {
      if(file.exists(FILE)) file.remove(FILE)
  }
}

## ------------------------------------------------------------------------
summary(res_cor_probit_2raters)

## ------------------------------------------------------------------------
coef(res_cor_probit_2raters)

## ----eval = FALSE--------------------------------------------------------
#  res_cor_probit_3raters <- mvord(formula = MMO2(rater1, rater2, rater 3) ~ 0 + LR + LEV + PR + RSIZE + BETA,
#                                 coef.constraints = c(1, 1, 1),
#                                 data = data_cr,
#                                 link = mvlogit())

## ----echo = FALSE, results = 'hide', eval = TRUE-------------------------
cache <- TRUE
FILE <- "res_cor_probit_3raters.rda"
if (cache & file.exists(FILE)) {
  load(FILE)
} else {
  if (cache) {
res_cor_probit_3raters <- mvord(formula = MMO2(rater1, rater2, rater3) ~ 0 + LR + LEV + PR + RSIZE + BETA,
                               coef.constraints = c(1, 1, 1),
                               data = data_cr,
                               link = mvlogit())
res_cor_probit_3raters <- mvord:::reduce_size.mvord(res_cor_probit_3raters)
  save(res_cor_probit_3raters, file  = FILE)
  } else {
      if(file.exists(FILE)) file.remove(FILE)
  }
}

## ------------------------------------------------------------------------
summary(res_cor_probit_3raters)

## ------------------------------------------------------------------------
thresholds(res_cor_probit_3raters)

## ----eval = FALSE--------------------------------------------------------
#  res_cor_probit_simple <- mvord(formula = MMO2(rater1, rater2, rater3,
#    rater4) ~ 0 + LR + LEV + PR + RSIZE + BETA, data = data_cr)

## ----echo = FALSE, results = 'hide', eval = TRUE-------------------------
cache <- TRUE
FILE <- "res_cor_probit_simple.rda"
if (cache & file.exists(FILE)) {
  load(FILE)
} else {
  if (cache) {
res_cor_probit_simple <- mvord(
    formula =
    MMO2(rater1, rater2, rater3, rater4) ~ 0 + LR + LEV + PR + RSIZE + BETA, data = data_cr)
res_cor_probit_simple <- mvord:::reduce_size.mvord(res_cor_probit_simple)
  save(res_cor_probit_simple, file  = FILE)
  } else {
      if(file.exists(FILE)) file.remove(FILE)
  }
}

## ------------------------------------------------------------------------
summary(res_cor_probit_simple)

## ------------------------------------------------------------------------
thresholds(res_cor_probit_simple)

## ------------------------------------------------------------------------
coef(res_cor_probit_simple)

## ------------------------------------------------------------------------
error_structure(res_cor_probit_simple)[[11]]

## ----eval = FALSE--------------------------------------------------------
#  res_cor_logit <- mvord(formula = MMO2(rater1, rater2, rater3, rater4) ~
#      0 + LR + LEV + PR + RSIZE + BETA, data = data_cr, link = mvlogit(),
#      coef.constraints = cbind(LR = c(1, 1, 1, 1), LEV = c(1, 2, 3, 4),
#        PR = c(1, 1, 1, 1), RSIZE = c(1, 1, 1, 2), BETA = c(1, 1, 2, 3)),
#      threshold.constraints = c(1, 1, 2, 3))

## ----echo = FALSE, results = 'hide', eval = TRUE-------------------------
FILE <- "res_cor_logit.rda"
if (cache & file.exists(FILE)) {
  load(FILE)
} else {
  if (cache) {
res_cor_logit <- mvord(formula = MMO2(rater1, rater2, rater3, rater4) ~
    0 + LR + LEV + PR + RSIZE + BETA, data = data_cr, link = mvlogit(),
  coef.constraints = cbind(
    c(1,1,1,1),
    c(1,2,3,4),
    c(1,1,1,1),
    c(1,1,1,2),
    c(1,1,2,3)),
    threshold.constraints = c(1, 1, 2, 3))
#res_cor_logit <- mvord:::reduce_size2.mvord(res_cor_logit)
  save(res_cor_logit, file  = FILE)
  } else {
      if(file.exists(FILE)) file.remove(FILE)
  }

}

## ------------------------------------------------------------------------
summary(res_cor_logit)

## ------------------------------------------------------------------------
constraints(res_cor_logit)

## ------------------------------------------------------------------------
BIC(res_cor_probit_simple)
BIC(res_cor_logit)

## ------------------------------------------------------------------------
AIC(res_cor_probit_simple)
AIC(res_cor_logit)

## ------------------------------------------------------------------------
logLik(res_cor_probit_simple)
logLik(res_cor_logit)

## ------------------------------------------------------------------------
mp <- marginal_predict(res_cor_logit, type = "class")

## ------------------------------------------------------------------------
table(res_cor_logit$rho$y[,1], mp[,1])
table(res_cor_logit$rho$y[,2], mp[,2])
table(res_cor_logit$rho$y[,3], mp[,3])
table(res_cor_logit$rho$y[,4], mp[,4])

## ----eval = FALSE--------------------------------------------------------
#  jp <- joint_probabilities(res_cor_logit, type = "class")

## ----echo = FALSE, results = 'hide', eval = TRUE-------------------------
FILE <- "jp.rda"
if (cache & file.exists(FILE)) {
  load(FILE)
} else {
  if (cache) {
jp <- predict(res_cor_logit, type = "class")
  save(jp, file  = FILE)
  } else {
      if(file.exists(FILE)) file.remove(FILE)
  }
}

## ------------------------------------------------------------------------
table(res_cor_logit$rho$y[,1], jp[,1])
table(res_cor_logit$rho$y[,2], jp[,2])
table(res_cor_logit$rho$y[,3], jp[,3])
table(res_cor_logit$rho$y[,4], jp[,4])

## ------------------------------------------------------------------------
data(data_cr_panel)
str(data_cr_panel, vec.len = 3)
head(data_cr_panel, n = 3)

## ----eval=F--------------------------------------------------------------
#  res_AR1_probit <- mvord(formula = MMO(rating, firm_id, year) ~ LR + LEV +
#    PR + RSIZE + BETA, error.structure = cor_ar1(~ BSEC), link = mvprobit(),
#    data = data_cr_panel, coef.constraints = c(rep(1, 4), rep(2, 4)),
#    threshold.constraints = rep(1, 8), threshold.values = rep(list(c(0, NA,
#      NA, NA)),8), mvord.control(solver = "BFGS"))

## ----echo = FALSE, results = 'hide', eval = TRUE-------------------------
FILE <- "res_AR1_probit.rda"
if (cache & file.exists(FILE)) {
  load(FILE)
} else {
  if (cache) {
res_AR1_probit <- mvord(
  formula = MMO(rating, firm_id, year) ~ LR + LEV + PR + RSIZE +  BETA,
  data = data_cr_panel,
  error.structure = cor_ar1(~ BSEC),
  coef.constraints = c(rep(1,4), rep(2,4)),
  threshold.constraints = c(rep(1,8)),
  threshold.values = rep(list(c(0,NA,NA,NA)),8),
  link = mvprobit(),
  control = mvord.control(solver = "BFGS",  solver.optimx.control = list(trace = TRUE)))
   res_AR1_probit <- mvord:::reduce_size.mvord(res_AR1_probit)
  save(res_AR1_probit, file  = FILE)
  } else {
      if(file.exists(FILE)) file.remove(FILE)
  }
}

## ------------------------------------------------------------------------
summary(res_AR1_probit, short = TRUE, call = FALSE)

## ------------------------------------------------------------------------
error_structure(res_AR1_probit)

## ------------------------------------------------------------------------
head(error_structure(res_AR1_probit, type = "corr"), n = 3)

## ------------------------------------------------------------------------
head(error_structure(res_AR1_probit, type = "sigmas"), n = 1)

