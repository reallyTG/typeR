## ---- echo=FALSE, message=FALSE------------------------------------------
library(olsrr)
library(dplyr)
library(ggplot2)
library(gridExtra)
library(purrr)
library(tibble)
library(nortest)
library(goftest)

## ----allsub--------------------------------------------------------------
model <- lm(mpg ~ disp + hp + wt + qsec, data = mtcars)
ols_step_all_possible(model)

## ----allsubplot, fig.width=10, fig.height=10, fig.align='center'---------
model <- lm(mpg ~ disp + hp + wt + qsec, data = mtcars)
k <- ols_step_all_possible(model)
plot(k)

## ----bestsub, size='tiny'------------------------------------------------
model <- lm(mpg ~ disp + hp + wt + qsec, data = mtcars)
ols_step_best_subset(model)

## ----bestsubplot, fig.width=10, fig.height=10, fig.align='center'--------
model <- lm(mpg ~ disp + hp + wt + qsec, data = mtcars)
k <- ols_step_best_subset(model)
plot(k)

## ----stepf1--------------------------------------------------------------
# stepwise forward regression
model <- lm(y ~ ., data = surgical)
ols_step_forward_p(model)

## ----stepf2, fig.width=10, fig.height=10, fig.align='center'-------------
model <- lm(y ~ ., data = surgical)
k <- ols_step_forward_p(model)
plot(k)

## ----stepwisefdetails----------------------------------------------------
# stepwise forward regression
model <- lm(y ~ ., data = surgical)
ols_step_forward_p(model, details = TRUE)

## ----stepb, fig.width=10, fig.height=10, fig.align='center'--------------
# stepwise backward regression
model <- lm(y ~ ., data = surgical)
ols_step_backward_p(model)

## ----stepb2, fig.width=10, fig.height=10, fig.align='center'-------------
model <- lm(y ~ ., data = surgical)
k <- ols_step_backward_p(model)
plot(k)

## ----stepwisebdetails----------------------------------------------------
# stepwise backward regression
model <- lm(y ~ ., data = surgical)
ols_step_backward_p(model, details = TRUE)

## ----stepwise1-----------------------------------------------------------
# stepwise regression
model <- lm(y ~ ., data = surgical)
ols_step_both_p(model)

## ----stepwise2, fig.width=10, fig.height=10, fig.align='center'----------
model <- lm(y ~ ., data = surgical)
k <- ols_step_both_p(model)
plot(k)

## ----stepwisedetails-----------------------------------------------------
# stepwise regression
model <- lm(y ~ ., data = surgical)
ols_step_both_p(model, details = TRUE)

## ----stepaicf1-----------------------------------------------------------
# stepwise aic forward regression
model <- lm(y ~ ., data = surgical)
ols_step_forward_aic(model)

## ----stepaicf2, fig.width=5, fig.height=5, fig.align='center'------------
model <- lm(y ~ ., data = surgical)
k <- ols_step_forward_aic(model)
plot(k)

## ----stepwiseaicfdetails-------------------------------------------------
# stepwise aic forward regression
model <- lm(y ~ ., data = surgical)
ols_step_forward_aic(model, details = TRUE)

## ----stepaicb1-----------------------------------------------------------
# stepwise aic backward regression
model <- lm(y ~ ., data = surgical)
k <- ols_step_backward_aic(model)
k

## ----stepaicb2, fig.width=5, fig.height=5, fig.align='center'------------
model <- lm(y ~ ., data = surgical)
k <- ols_step_backward_aic(model)
plot(k)

## ----stepwiseaicbdetails-------------------------------------------------
# stepwise aic backward regression
model <- lm(y ~ ., data = surgical)
ols_step_backward_aic(model, details = TRUE)

## ----stepwiseaic1--------------------------------------------------------
# stepwise aic regression
model <- lm(y ~ ., data = surgical)
ols_step_both_aic(model)

## ----stepwiseaic2, fig.width=5, fig.height=5, fig.align='center'---------
model <- lm(y ~ ., data = surgical)
k <- ols_step_both_aic(model)
plot(k)

## ----stepwiseaicdetails--------------------------------------------------
# stepwise aic regression
model <- lm(y ~ ., data = surgical)
ols_step_both_aic(model, details = TRUE)

