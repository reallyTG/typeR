## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ---- vinylidene, warning=FALSE, message=FALSE---------------------------
library(goric)
data(vinylidene)
knitr::kable(head(vinylidene))

## ---- lm-----------------------------------------------------------------
m <- lm(cbind(SDH, SGOT, SGPT) ~ 0 + dose, data=vinylidene)
knitr::kable(coefficients(m))

## ------------------------------------------------------------------------
unconstrained <- orlm(cbind(SDH, SGOT, SGPT) ~ 0 + dose, 
                      data=vinylidene,
                      constr=matrix(0, nrow=1, ncol=12), 
                      rhs=0, nec=0)
knitr::kable(coefficients(unconstrained))

## ------------------------------------------------------------------------
cmat <- cbind(-diag(3), 0) + cbind(0, diag(3))
constr <- kronecker(diag(3), cmat)
knitr::kable(constr)

## ------------------------------------------------------------------------
monotone <- orlm(cbind(SDH, SGOT, SGPT) ~ dose-1,
                 data=vinylidene,
                 constr=constr, 
                 rhs=rep(0, nrow(constr)), 
                 nec=0)
knitr::kable(round(coefficients(monotone), 2))

## ------------------------------------------------------------------------
noeffect <- orlm(cbind(SDH, SGOT, SGPT) ~ dose-1,
                 data=vinylidene,
                 constr=constr, 
                 rhs=rep(0, nrow(constr)), 
                 nec=nrow(constr))
knitr::kable(round(coefficients(noeffect), 2))

## ------------------------------------------------------------------------
ic <- goric(unconstrained, monotone, noeffect, iter=100000)
knitr::kable(ic)

