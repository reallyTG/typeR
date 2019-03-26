## ----setup, include=FALSE------------------------------------------------
library(grpreg)
set.seed(4)
knitr::opts_knit$set(aliases=c(h = 'fig.height', w = 'fig.width'))
knitr::opts_chunk$set(comment="#", collapse=TRUE, cache=FALSE, tidy=FALSE)
knitr::knit_hooks$set(small.mar = function(before, options, envir) {
  if (before) par(mar = c(4, 4, .1, .1))
})

## ----Birthwt-------------------------------------------------------------
data(Birthwt)
X <- Birthwt$X
y <- Birthwt$bwt
head(X)

## ----Birthwt_group-------------------------------------------------------
group <- Birthwt$group
group

## ----fit-----------------------------------------------------------------
fit <- grpreg(X, y, group, penalty="grLasso")

## ----plot, h=4, w=6, small.mar=TRUE--------------------------------------
plot(fit)

## ----coef----------------------------------------------------------------
coef(fit, lambda=0.05)

## ----cvplot, h=5, w=6----------------------------------------------------
cvfit <- cv.grpreg(X, y, group, penalty="grLasso")
plot(cvfit)

## ----cv_coef-------------------------------------------------------------
coef(cvfit)

## ----predict-------------------------------------------------------------
predict(cvfit, X=head(X))                 # Predictions for new observations
predict(fit, type="ngroups", lambda=0.1)  # Number of nonzero groups
predict(fit, type="groups", lambda=0.1)   # Identity of nonzero groups
predict(fit, type="nvars", lambda=0.1)    # Number of nonzero coefficients
predict(fit, type="vars", lambda=0.1)     # Identity of nonzero coefficients

