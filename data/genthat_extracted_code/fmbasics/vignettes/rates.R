## ---- echo = FALSE-------------------------------------------------------
knitr::opts_chunk$set(collapse = TRUE, comment = "#>")

## ----interest_rate_make--------------------------------------------------
library("fmdates")
library("fmbasics")
# Quarterly compounding, with Actual/365 day basis
(rate <- InterestRate(value = 0.04, compounding = 4, day_basis = 'act/365'))

## ----convert-------------------------------------------------------------
as_InterestRate(rate, compounding = 2)
as_InterestRate(rate, day_basis = 'act/360')
as_InterestRate(rate, compounding = Inf, day_basis = '30/360us')

## ----rate_ops------------------------------------------------------------
rate1 <- InterestRate(0.04, 2, 'act/365')
rate2 <- InterestRate(0.01, Inf, 'act/360')
rate1 + rate2

## ----to_df, message=FALSE------------------------------------------------
library("lubridate")
df <- as_DiscountFactor(rate, ymd(20140101), ymd(20140401))

## ----interest_rate_vectorised--------------------------------------------
rates <- InterestRate(seq(0.04, 0.05, 1e-4), 2, 'act/365')
rates[23:26]
rates[23:26] <- InterestRate(0.05, 2, 'act/365')
rates[23:26]

## ----discount_factor_make------------------------------------------------
(df <- DiscountFactor(0.9, ymd(20140101), ymd(20150101)))

## ----to_rate-------------------------------------------------------------
as_InterestRate(df, compounding = 2, day_basis = 'act/365')

## ----df_vectorised-------------------------------------------------------
dfs <- DiscountFactor(seq(1, 0.9, -1e-3), ymd(20140101), ymd(20150101) + days(0:100))
dfs[23:26]

