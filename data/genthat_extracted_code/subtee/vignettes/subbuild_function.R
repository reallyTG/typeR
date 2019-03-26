## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ---- show='hold'--------------------------------------------------------
library(subtee)
################################################################################
# The data comes from a clinical trial of an prostate cancer treatment
# Data is loaded from Royston, Patrick, and Willi Sauerbrei. Multivariable model-building: a pragmatic approach to regression anaylsis based on fractional polynomials for modelling continuous variables. Vol. 777. John Wiley & Sons, 2008. https://www.imbi.uni-freiburg.de/Royston-Sauerbrei-book
data_url = "https://www.imbi.uni-freiburg.de/imbi/Royston-Sauerbrei-book/Multivariable_Model-building/downloads/datasets/adv_prostate_ca.zip"
temp <- tempfile()
download.file(data_url, temp, cacheOK = FALSE)
prca = read.csv(unz(temp, "adv_prostate_ca/adv_prostate_ca.csv"))
names(prca) = toupper(names(prca))



## ------------------------------------------------------------------------
subgroups <- subbuild(data = prca, AGE > 65)
head(subgroups)

## ------------------------------------------------------------------------
subgroups <- subbuild(data = prca, AGE, n.cuts = 4)
head(subgroups)

## ------------------------------------------------------------------------
subgroups <- subbuild(data = prca, BM == 1)
head(subgroups)

## ------------------------------------------------------------------------
cand.groups <- subbuild(prca, 
                        BM == 1, PF == 1, HX == 1,
                        STAGE == 4, AGE > 65, WT > 100)
head(cand.groups)

## ------------------------------------------------------------------------
cand.groups <- subbuild(prca[,2:7])
head(cand.groups)

## ------------------------------------------------------------------------
cand.groups <- subbuild(prca, AGE, WT, SBP, DBP, SZ, AP)
head(cand.groups)

## ------------------------------------------------------------------------
fitdat <- cbind(prca[, c("SURVTIME", "CENS", "RX")], cand.groups)
head(fitdat)

## ------------------------------------------------------------------------
cand.groups <- subbuild(prca, 
                        BM == 1, PF == 1, HX == 1,
                        STAGE == 4, AGE > 65, WT > 100, make.valid.names = TRUE)
head(cand.groups)

