## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----load data, show='hold'----------------------------------------------
library(ggplot2)
library(subtee)
################################################################################
# We use the dataset from Rosenkranz (2016) https://onlinelibrary.wiley.com/doi/abs/10.1002/bimj.201500147
# to illustrate the methods proposed in this work.
# The data comes from a clinical trial of an prostate cancer treatment
# Data is loaded from Royston, Patrick, and Willi Sauerbrei. Multivariable model-building: a pragmatic approach to regression anaylsis based on fractional polynomials for modelling continuous variables. Vol. 777. John Wiley & Sons, 2008. https://www.imbi.uni-freiburg.de/Royston-Sauerbrei-book
data_url = "https://www.imbi.uni-freiburg.de/imbi/Royston-Sauerbrei-book/Multivariable_Model-building/downloads/datasets/adv_prostate_ca.zip"
temp <- tempfile()
download.file(data_url, temp, cacheOK = FALSE)
prca = read.csv(unz(temp, "adv_prostate_ca/adv_prostate_ca.csv"))
names(prca) = toupper(names(prca))


## ----data prep, show='hold'----------------------------------------------
cand.groups <- subbuild(prca, dupl.rm = TRUE,
                        BM == 1, PF == 1, HX == 1,
                        STAGE == 4, AGE > 65, WT > 100)
head(cand.groups)
fitdat <- cbind(prca, cand.groups)
subgr.names <- names(cand.groups)
prog <- as.formula(paste(" ~ ", paste0("`", names(cand.groups),"`", collapse = " + ")))

## ----overall model, show='hold'------------------------------------------
library(survival)
form <- as.formula(paste("Surv(SURVTIME,CENS) ~ RX +", paste0("`", names(cand.groups),"`", collapse = " + ")))
coxph(form, data=fitdat, ties = "breslow")

## ----unadj, show='hold'--------------------------------------------------
### Unadjusted estimates
res_unadj = unadj(resp = "SURVTIME", trt = "RX", subgr = subgr.names,
                  data = fitdat, covars = prog, 
                  event = "CENS", fitfunc = "coxph", ties = "breslow")
res_unadj

## ----modav, show='hold'--------------------------------------------------
### ModelAveraging estimates
res_modav = modav(resp = "SURVTIME", trt = "RX", subgr = subgr.names,
                  data = fitdat, covars = prog, 
                  event = "CENS", fitfunc = "coxph", ties = "breslow")
res_modav


## ----bagged, show='hold'-------------------------------------------------
### Bagged estimates
set.seed(321231) # set seed for reproducible results in the bootstrap samples
res_bagged = bagged(resp = "SURVTIME", trt = "RX", subgr = subgr.names,
                    data = fitdat, covars = prog, 
                    event = "CENS", fitfunc = "coxph",
                    select.by = "BIC", B = 200) #B = 2000)
res_bagged

