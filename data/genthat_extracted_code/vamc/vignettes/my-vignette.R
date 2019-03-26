## ---- echo = FALSE-------------------------------------------------------
  knitr::opts_chunk$set(collapse = TRUE, comment = "#>")
  library(vamc)

## ------------------------------------------------------------------------
# Initialize required inputs to boostrap a curve
swap <- c(0.69, 0.77, 0.88, 1.01, 1.14, 1.38, 1.66, 2.15)*0.01
tenor <- c(1, 2, 3, 4, 5, 7, 10, 30)
fixFreq <- 6
fixDCC <- "Thirty360"
fltFreq <- 6
fltDCC <- "ACT360"
calendar <- "NY"
bdc <- "Modified_Foll"
curveDate <- "2016-02-08"
numSetDay <- 2
yieldCurveDCC <- "Thirty360"
# Bootstrap a forward curve 
buildCurve(swap, tenor, fixFreq, fixDCC, fltFreq, fltDCC, calendar, bdc,
            curveDate, numSetDay, yieldCurveDCC)

## ---- echo=FALSE, results='asis'-----------------------------------------
# Default randomly generated covariance matrix
knitr::kable(mCov, col.names = indexNames)

## ---- echo=FALSE, results='asis'-----------------------------------------
# Default index names
knitr::kable(indexNames, col.names = c("Index Names"))

## ------------------------------------------------------------------------
# We will show the index simulated path for five months of the first scenario 
indexScen <- genIndexScen(mCov, 100, 360, indexNames, 1 / 12, cForwardCurve, 1)
indexScen[1, 1:5, ]


## ------------------------------------------------------------------------
# Again, we show the fund simulated path for five months of the first scenario 
fundScen <- genFundScen(fundMap, indexScen)
fundScen[1, 1:5, ]


## ------------------------------------------------------------------------
# For illustration purposes, we will only simulate one guarantee contract for each of the 19 guarantee types. Please note that due to randomness the generated portfolio under this code block may not align with the default VAPort under lazy data.
genPortInception(issueRng = c("2001-08-01", "2014-01-01"), numPolicy =  1)


## ------------------------------------------------------------------------
# In this vignette, we will arbitrarily use the first two scenarios from fundSen to valuate a portfolio of two guarantees to speed up the execution of the example.
# The input cForwardCurve is a vector of 0.02 with dimension 360. It could also be a forward curve calculated using the buildCurve() function.
valuatePortfolio(VAPort[1:2, ], mortTable, fundScen[1, , ], 1 / 12, cForwardCurve)


## ------------------------------------------------------------------------
# Again, we will arbitrarily age a portfolio of two guarantees to speed up the execution.
targetDate <- "2016-01-01"
# Here we generate historical fund scenarios using default index data stored under "histIdxScen"
histFundScen <- genFundScen(fundMap, histIdxScen)
# Perform aging
agePortfolio(VAPort[1:2, ], mortTable, histFundScen, histDates, dT = 1 / 12, targetDate, cForwardCurve)


## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ------------------------------------------------------------------------
exPolicy <- VAPort[1, ]
valuateOnePolicy(exPolicy, mortTable, fundScen[1:2, , ], 1 / 12, cForwardCurve)

## ------------------------------------------------------------------------
# Similarly, users can age this single policy before pricing it. We use the same target date and historical fund scenario as generated before
exPolicy <- VAPort[1, ]
ageOnePolicy(exPolicy, mortTable, histFundScen, histDates, dT = 1 / 12, targetDate, cForwardCurve)

