## ---- echo=FALSE, message=FALSE------------------------------------------
library(olsrr)
library(dplyr)
library(ggplot2)
library(gridExtra)
library(purrr)
library(tibble)
library(nortest)
library(goftest)

## ----regress-------------------------------------------------------------
ols_regress(mpg ~ disp + hp + wt + qsec, data = mtcars)

## ----rvsfplot, fig.width=5, fig.height=5, fig.align='center'-------------
model <- lm(mpg ~ disp + hp + wt + qsec, data = mtcars)
ols_plot_resid_fit(model)

## ----dfbpanel, fig.width=7, fig.height=7, fig.align='center'-------------
model <- lm(mpg ~ disp + hp + wt, data = mtcars)
ols_plot_dfbetas(model)

## ----rfsplot, fig.width=10, fig.height=5, fig.align='center'-------------
model <- lm(mpg ~ disp + hp + wt + qsec, data = mtcars)
ols_plot_resid_fit_spread(model)

## ----bp1-----------------------------------------------------------------
model <- lm(mpg ~ disp + hp + wt + drat, data = mtcars)
ols_test_breusch_pagan(model)

## ----colldiag------------------------------------------------------------
model <- lm(mpg ~ disp + hp + wt + qsec, data = mtcars)
ols_coll_diag(model)

## ----stepwise1-----------------------------------------------------------
# stepwise regression
model <- lm(y ~ ., data = surgical)
ols_step_both_p(model)

## ----stepwise2, fig.width=10, fig.height=15, fig.align='center'----------
model <- lm(y ~ ., data = surgical)
k <- ols_step_both_p(model)
plot(k)

## ----stepaicb1-----------------------------------------------------------
# stepwise aic backward regression
model <- lm(y ~ ., data = surgical)
k <- ols_step_backward_aic(model)
k

## ----stepaicb2, fig.width=5, fig.height=5, fig.align='center'------------
model <- lm(y ~ ., data = surgical)
k <- ols_step_backward_aic(model)
plot(k)

