## ----setup, include=TRUE-------------------------------------------------

## ----eval=FALSE----------------------------------------------------------
#  library(blscrapeR)
#  df <- bls_api("CUSR0000SA0")
#  head(df)

## ----eval=FALSE----------------------------------------------------------
#  library(blscrapeR)
#  df <- inflation_adjust(1995)
#  tail(df)

## ----eval=FALSE----------------------------------------------------------
#  library(blscrapeR)
#  df <- bls_api("CUSR0000SA0",
#                startyear = 2014, endyear = 2015)
#  head(df)
#  # Set base value.
#  base_value <- 100
#  # Get CPI from base period (January 2014).
#  base_cpi <- subset(df, year==2014 & periodName=="January", select = "value")
#  # Get the CPI for the new period (February 2015).
#  new_cpi <- subset(df, year==2015 & periodName=="February", select = "value")
#  # Calculate the updated value of our $100 investment.
#  (base_value / base_cpi) * new_cpi
#  # Woops, looks like we lost a penny!

