## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ---- echo=FALSE, results='asis'-----------------------------------------
knitr::kable(logiBin::getBins(logiBin::loanData, "bad_flag", c("age", "LTV", "score", "balance"), minCr = 0.8)$err)

## ---- echo=FALSE, results='asis'-----------------------------------------
knitr::kable(logiBin::getBins(logiBin::loanData, "bad_flag", c("age", "LTV", "score", "balance"), minCr = 0.8)$varSummary)

## ---- echo=FALSE, results='asis'-----------------------------------------
knitr::kable(logiBin::getBins(logiBin::loanData, "bad_flag", c("age", "LTV", "score", "balance"), minCr = 0.8)$bin)

## ---- echo=FALSE, results='asis'-----------------------------------------
knitr::kable(logiBin::forceDecrTrend(logiBin::getBins(logiBin::loanData, "bad_flag", c("age", "LTV", "score", "balance"), minCr = 0.8), "age")$bin)

