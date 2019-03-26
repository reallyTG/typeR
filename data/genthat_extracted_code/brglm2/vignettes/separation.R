## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>",
  fig.width = 6,
  fig.height = 6
)

## ---- echo = TRUE, eval = TRUE-------------------------------------------
library("brglm2")
data("endometrial", package = "brglm2")
modML <- glm(HG ~ NV + PI + EH, family = binomial("probit"), data = endometrial)
theta_mle <- coef(modML)
summary(modML)

## ---- echo = TRUE, eval = TRUE-------------------------------------------
check_infinite_estimates(modML)

## ---- eval = TRUE, echo = TRUE-------------------------------------------
endometrial_sep <- glm(HG ~ NV + PI + EH, data = endometrial,
                       family = binomial("logit"),
                       method = "detect_separation")
endometrial_sep

## ---- echo = TRUE,  eval = TRUE------------------------------------------
coef(modML) + endometrial_sep$betas

## ---- echo = TRUE,  eval = TRUE------------------------------------------
coef(summary(modML))[, "Std. Error"] + abs(endometrial_sep$betas)

## ---- echo = TRUE--------------------------------------------------------
citation("brglm2")

