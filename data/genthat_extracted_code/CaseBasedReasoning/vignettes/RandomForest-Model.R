## ----setup, include=FALSE------------------------------------------------
knitr::opts_chunk$set(echo = TRUE)

## ---- warning=FALSE, message=FALSE---------------------------------------
library(tidyverse)
library(survival)
library(CaseBasedReasoning)
ovarian$resid.ds <- factor(ovarian$resid.ds)
ovarian$rx <- factor(ovarian$rx)
ovarian$ecog.ps <- factor(ovarian$ecog.ps)

# initialize R6 object
coxBeta <- CoxBetaModel$new(Surv(futime, fustat) ~ age + resid.ds + rx + ecog.ps)

## ------------------------------------------------------------------------
n <- nrow(ovarian)
trainID <- sample(1:n, floor(0.8 * n), F)
testID <- (1:n)[-trainID]

# fit model 
ovarian[trainID, ] %>% 
  coxBeta$fit()
# get similar cases
ovarian[trainID, ] %>%
  coxBeta$get_similar_cases(queryData = ovarian[testID, ], k = 3) -> matchedData
knitr::kable(head(matchedData))

## ------------------------------------------------------------------------
ovarian %>%
  coxBeta$calc_distance_matrix() -> ditMatrix

## ---- warning=FALSE, message=FALSE---------------------------------------
pp <- coxBeta$check_ph()
pp

