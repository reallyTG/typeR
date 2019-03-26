## ----setup, include=FALSE------------------------------------------------
library(ncvreg)
set.seed(4)
knitr::opts_knit$set(aliases=c(h = 'fig.height', w = 'fig.width'))
knitr::opts_chunk$set(comment="#", collapse=TRUE, cache=FALSE, tidy=FALSE)
knitr::knit_hooks$set(small.mar = function(before, options, envir) {
  if (before) par(mar = c(4, 4, .1, .1))
})

## ----prostate------------------------------------------------------------
data(Prostate)
X <- Prostate$X
y <- Prostate$y

## ----fit-----------------------------------------------------------------
fit <- ncvreg(X, y)

## ----plot, h=4, w=6, small.mar=TRUE--------------------------------------
plot(fit)

## ----coef----------------------------------------------------------------
coef(fit, lambda=0.05)

## ----summary, output.lines=1:5-------------------------------------------
summary(fit, lambda=0.05)

## ----cvplot, h=5, w=6----------------------------------------------------
cvfit <- cv.ncvreg(X, y)
plot(cvfit)

## ----cvcoef--------------------------------------------------------------
coef(cvfit)

## ----predict-------------------------------------------------------------
predict(cvfit, X=head(X))     # Prediction of response for new observations
predict(cvfit, type="nvars")  # Number of nonzero coefficients
predict(cvfit, type="vars")   # Identity of the nonzero coefficients

