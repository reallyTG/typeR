params <-
list(EVAL = FALSE)

## ----load_lib,echo=FALSE-------------------------------------------------
library(glmmTMB)
knitr::opts_chunk$set(eval = if (isTRUE(exists("params"))) params$EVAL else FALSE)

## ----non-pos-def,cache=TRUE----------------------------------------------
#  zinbm0 = glmmTMB(count~spp + (1|site), zi=~spp, Salamanders, family=nbinom2)

## ----fixef_zinbm0--------------------------------------------------------
#  fixef(zinbm0)

## ----f_zi2---------------------------------------------------------------
#  ff <- fixef(zinbm0)$zi
#  round(plogis(c(sppGP=unname(ff[1]),ff[-1]+ff[1])),3)

## ----salfit2,cache=TRUE--------------------------------------------------
#  Salamanders <- transform(Salamanders, GP=as.numeric(spp=="GP"))
#  zinbm0_A = update(zinbm0, ziformula=~GP)

## ----salfit2_coef,cache=TRUE---------------------------------------------
#  fixef(zinbm0_A)[["zi"]]

## ----salfit3,cache=TRUE--------------------------------------------------
#  zinbm0_B = update(zinbm0, ziformula=~(1|spp))
#  fixef(zinbm0_B)[["zi"]]
#  VarCorr(zinbm0_B)

## ----zinbm1,cache=TRUE---------------------------------------------------
#  zinbm1 = glmmTMB(count~spp + (1|site), zi=~mined, Salamanders, family=nbinom2)
#  fixef(zinbm1)[["zi"]]

## ----zinbm1_confint,cache=TRUE-------------------------------------------
#  ## at present we need to specify the parameter by number; for
#  ##  extreme cases need to specify the parameter range
#  ## (not sure why the upper bound needs to be so high ... ?)
#  cc = confint(zinbm1,method="uniroot",parm=9, parm.range=c(-20,20))
#  print(cc)

## ----genpois_NaN,cache=TRUE----------------------------------------------
#  m1 = glmmTMB(count~spp + mined + (1|site), zi=~spp + mined, Salamanders, family=genpois)

## ----Cholmod, eval=FALSE-------------------------------------------------
#  Cholmod warning 'matrix not positive definite'

## ----lgamma, eval=FALSE--------------------------------------------------
#  Warning in f(par, order = order, ...) : value out of range in 'lgamma'

## ----NA gradient, error=TRUE, warning=FALSE------------------------------
#  dat1 = expand.grid(y=-1:1, rep=1:10)
#  m1 = glmmTMB(y~1, dat1, family=nbinom2)

