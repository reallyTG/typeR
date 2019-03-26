## ---- echo=FALSE, message=FALSE------------------------------------------
library(olsrr)
library(dplyr)
library(ggplot2)
library(gridExtra)
library(purrr)
library(tibble)
library(nortest)
library(goftest)

## ----ckdbp, fig.width=7, fig.height=5, fig.align='center'----------------
model <- lm(mpg ~ disp + hp + wt + qsec, data = mtcars)
ols_plot_cooksd_bar(model)

## ----ckchart, fig.width=5, fig.height=5, fig.align='center'--------------
model <- lm(mpg ~ disp + hp + wt + qsec, data = mtcars)
ols_plot_cooksd_chart(model)

## ----dfbpanel, fig.width=7, fig.height=7, fig.align='center'-------------
model <- lm(mpg ~ disp + hp + wt, data = mtcars)
ols_plot_dfbetas(model)

## ----dfitsplot, fig.width=5, fig.height=5, fig.align='center'------------
model <- lm(mpg ~ disp + hp + wt + qsec, data = mtcars)
ols_plot_dffits(model)

## ----srplot, fig.width=5, fig.height=5, fig.align='center'---------------
model <- lm(mpg ~ disp + hp + wt + qsec, data = mtcars)
ols_plot_resid_stud(model)

## ----srchart, fig.width=5, fig.height=5, fig.align='center'--------------
model <- lm(mpg ~ disp + hp + wt + qsec, data = mtcars)
ols_plot_resid_stand(model)

## ----studlev, fig.width=7, fig.height=5, fig.align='center'--------------
model <- lm(read ~ write + math + science, data = hsb)
ols_plot_resid_lev(model)

## ----dsrvsp, fig.width=7, fig.height=5, fig.align='center'---------------
model <- lm(mpg ~ disp + hp + wt + qsec, data = mtcars)
ols_plot_resid_stud_fit(model)

## ----hadiplot, fig.width=5, fig.height=5, fig.align='center'-------------
model <- lm(mpg ~ disp + hp + wt + qsec, data = mtcars)
ols_plot_hadi(model)

## ----potres, fig.width=5, fig.height=5, fig.align='center'---------------
model <- lm(mpg ~ disp + hp + wt + qsec, data = mtcars)
ols_plot_resid_pot(model)

