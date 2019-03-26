## ----setup, include=FALSE------------------------------------------------
knitr::opts_chunk$set(echo = TRUE, results='asis')
library(dplyr)
library(knitr)

## ------------------------------------------------------------------------
library(imaginator)
set.seed(12345)
dfPolicy <- SimulatePolicies(2, 2001:2005)

dfPolicy %>% 
  head(5) %>% 
  kable()

## ------------------------------------------------------------------------
dfClaimTransactions <- ClaimsByWaitTime(
    dfPolicy
  , ClaimFrequency = FixedHelper(2)
  , PaymentFrequency = FixedHelper(3)
  , OccurrenceWait = FixedHelper(10)
  , ReportWait = FixedHelper(5)
  , PayWait = FixedHelper(5)
  , PaySeverity = FixedHelper(50))

## ------------------------------------------------------------------------
dfClaimTransactions %>% 
  filter(PolicyholderID == 1, lubridate::year(PolicyEffectiveDate) == 2001) %>% 
  select(ClaimID, OccurrenceDate, ReportDate, PaymentDate, PaymentAmount) %>% 
  kable()

## ------------------------------------------------------------------------
dfClaimTransactions <- ClaimsByWaitTime(
    dfPolicy
  , ClaimFrequency = FixedHelper(2)
  , PaymentFrequency = PoissonHelper(2)
  , OccurrenceWait = PoissonHelper(10)
  , ReportWait = PoissonHelper(5)
  , PayWait = PoissonHelper(5)
  , PaySeverity = LognormalHelper(log(50), 0.5*log(50)))

## ----echo=FALSE----------------------------------------------------------
dfClaimTransactions %>% 
  filter(PolicyholderID == 1, lubridate::year(PolicyEffectiveDate) == 2001) %>% 
  select(ClaimID, OccurrenceDate, ReportDate, PaymentDate, PaymentAmount) %>% 
  kable()

## ------------------------------------------------------------------------
set.seed(12345)
dfPolicy <- SimulatePolicies(2, 2001:2005)

lstFreq <- list(
    FixedHelper(4)
  , FixedHelper(3)
  , FixedHelper(2)
  , FixedHelper(1)
)

lstSev <- list(
  FixedHelper(250)
)
lstSev[1:4] <- lstSev[1]

dfIBNYR_Fixed <- ClaimsByFirstReport(
    dfPolicy
  , Frequency = lstFreq
  , PaymentSeverity = lstSev
  , Lags = 1:4)

## ------------------------------------------------------------------------
dfIBNYR_Fixed %>% 
  filter(PolicyholderID == 1) %>% 
  filter(PolicyEffectiveDate == min(PolicyEffectiveDate)) %>% 
  kable()

## ------------------------------------------------------------------------
lstFreq <- list(
    PoissonHelper(4)
  , PoissonHelper(3)
  , PoissonHelper(2)
  , PoissonHelper(1)
)

lstSev <- list(
  LognormalHelper(meanlog = log(10000), sdlog = .5*log(10000))
)
lstSev[1:4] <- lstSev[1]

dfIBNYR_Random <- ClaimsByFirstReport(
    dfPolicy
  , Frequency = lstFreq
  , PaymentSeverity = lstSev
  , Lags = 1:4)

## ------------------------------------------------------------------------
dfIBNYR_Random %>% 
  filter(PolicyholderID == 1) %>% 
  filter(PolicyEffectiveDate == min(PolicyEffectiveDate)) %>% 
  kable()

## ------------------------------------------------------------------------
fixedLinks <- list(FixedHelper(2)
                   , FixedHelper(1.5)
                   , FixedHelper(1.25))

## ------------------------------------------------------------------------
dfClaimsFixed <- ClaimsByLinkRatio(dfIBNYR_Fixed
                                   , Links = fixedLinks
                                   , Lags = 1:4)

## ------------------------------------------------------------------------
dfClaimsFixed %>% 
  filter(PolicyholderID == 1) %>% 
  filter(PolicyEffectiveDate == min(PolicyEffectiveDate)
         , ClaimID %in% c(1, 41)) %>%
  arrange(ClaimID, Lag) %>% 
  kable()

## ------------------------------------------------------------------------
normalLinks <- list(NormalHelper(2, 1, .7, 4)
                    , NormalHelper(1.5, .5, .7, 3)
                    , NormalHelper(1.25, .5, .7, 3))

dfClaimsRandom <- ClaimsByLinkRatio(dfIBNYR_Random
                                   , Links = normalLinks
                                   , Lags = 1:4)

## ------------------------------------------------------------------------
dfClaimsRandom %>% 
  filter(PolicyholderID == 1) %>% 
  filter(PolicyEffectiveDate == min(PolicyEffectiveDate)) %>%
  arrange(ClaimID, Lag) %>% 
  kable()

