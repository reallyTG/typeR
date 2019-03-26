## ----setup1, include=FALSE, echo=FALSE-----------------------------------
require(knitr)

## ----setup2, include=FALSE,echo=FALSE-----------------------------------------
options(width=80)  # make the printing fit on the page
set.seed(1121)     # make the results repeatable
stdt<-date()

## ----beta, eval=FALSE---------------------------------------------------------
#  beta <- betaEst(fam_group, alpha, dtime, delta,
#                  g, var, lower = 0, upper = 2)

## ----var, eval=FALSE----------------------------------------------------------
#  var <- varEst(fam_group, alpha, dtime, delta,
#                g, beta, lower = 0, upper = 2)

## ----alpha, eval=FALSE--------------------------------------------------------
#  alpha <- alphaEst(dtime, delta)

## ----inputPara----------------------------------------------------------------
alphas <- c(0.75, 0.6666667, 0.5, 0.0)
fgrp   <- c(1, 1, 1, 2, 2, 2, 3, 3, 3)
dtimes <- c(1, 3, 3, 4, 1, 1, 2, 3, 1)
deltas <- c(1, 0, 1, 1, 1, 0, 1, 0, 1)
gs     <- c(0, 1, 1, 1, 2, 2, 0, 0, 0)
var    <- 0.2

## ----loadpkg------------------------------------------------------------------
library(lclGWAS)

## ----expa,size='tiny'---------------------------------------------------------
alphaest <- alphaEst(dtimes, deltas)$alphaEst
alphaest

## ----expv,size='tiny'---------------------------------------------------------
var <- varEst(fgrp, alphaest, dtimes, deltas, gs, beta = 0, lower = 0, upper = 2)
var$varEst

## ----expb,size='tiny'---------------------------------------------------------
betaEst(fgrp, alphaest, dtimes, deltas, gs, var$varEst, lower = 0, upper = 2)

## ----sessinfo, echo=FALSE, include=TRUE, results='asis'-----------------------
toLatex(sessionInfo(), locale=FALSE)

## ----times, echo=FALSE, include=TRUE------------------------------------------
print(paste("Start Time",stdt))
print(paste("End Time  ",date()))

