## ---- echo = FALSE, message = FALSE--------------------------------------
#knitr::opts_chunk$set(collapse = TRUE, comment = "#>")
library(Matrix)
library(nlme)
library(survival)
library(joineR)
library(joineRML)

## ----vignette, eval=FALSE------------------------------------------------
#  vignette("technical", package = "joineRML")

## ----heart.valve_help, eval=FALSE----------------------------------------
#  help("heart.valve", package = "joineRML")

## ----heart.valve_data----------------------------------------------------
library("joineRML")
data("heart.valve")
head(heart.valve)

## ----heart.valve_dimnames------------------------------------------------
dim(heart.valve)
names(heart.valve)

## ----hvd_data------------------------------------------------------------
hvd <- heart.valve[!is.na(heart.valve$grad) & !is.na(heart.valve$lvmi), ]

## ----hvd_model_summary---------------------------------------------------
summary(fit)

## ----hvd_model_generics--------------------------------------------------
coef(fit)
fixef(fit, process = "Longitudinal")
fixef(fit, process = "Event")
head(ranef(fit))

## ----hvd_model_conv, fig.height=8, fig.width=7.25------------------------
plot(fit, params = "gamma")
plot(fit, params = "beta")

## ----hvd_model_boot, eval=FALSE------------------------------------------
#  fit.se <- bootSE(fit, nboot = 100)

## ----hvd_model_boot_print, eval=FALSE------------------------------------
#  fit.se

## ----hvd_model_boot_summary, eval=FALSE----------------------------------
#  summary(fit, bootSE = fit.se)

## ----re_comp_plot, fig.width=7.25, fig.height=4--------------------------
id <- as.numeric(row.names(fit.joiner$coefficients$random))
id.ord <- order(id) # joineR rearranges patient ordering during EM fit
par(mfrow = c(1, 2))
plot(fit.joiner$coefficients$random[id.ord, 1], ranef(fit.joinerml)[, 1],
     main = "Predicted random intercepts",
     xlab = "joineR", ylab = "joineRML")
grid()
abline(a = 0, b = 1, col = 2, lty = "dashed")
plot(fit.joiner$coefficients$random[id.ord, 2], ranef(fit.joinerml)[, 2],
     main = "Predicted random slopes",
     xlab = "joineR", ylab = "joineRML")
grid()
abline(a = 0, b = 1, col = 2, lty = "dashed")

