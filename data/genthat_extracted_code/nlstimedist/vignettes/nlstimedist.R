## ---- include = FALSE----------------------------------------------------
library(nlstimedist)
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = NA
)

## ----viewTilia-----------------------------------------------------------
head(lobelia)

## ----cleanTilia----------------------------------------------------------
tdLobelia <- tdData(lobelia, x = "Day", y = "Germination", 
                    group = "Temperature")
tdLobelia

## ----fitModel------------------------------------------------------------
# Fitting the model to data already in the format x = time and y = proportion 
# of cumulative number of events.
lobelia12_5 <- tdLobelia$clean[tdLobelia$clean$Temperature == 12.5, ]
model12_5 <- timedist(lobelia12_5, x = "Day", y = "propMax", 
                      r = 0.03, c = 0.5, t = 14.5)
model12_5

## ----fixVals-------------------------------------------------------------
modelFix <- timedist(data = lobelia12_5, x = "Day", y = "propMax", 
                     r = 0.03, c = 0.5, t = 14.5, 
                     upper = c(0.1, Inf, Inf), lower = c(0.01, -Inf, -Inf))
modelFix

## ----standErrors---------------------------------------------------------
summary(model12_5, correlation = TRUE, symbolic.cor = FALSE)

## ----cors----------------------------------------------------------------
cpe <- vcov(model12_5)
cov2cor(cpe)

## ----confint-------------------------------------------------------------
confint2(model12_5)

## ----rss-----------------------------------------------------------------
tdRSS(model12_5)

## ----moments-------------------------------------------------------------
model12_5$m$getMoments()

## ----singlePerc----------------------------------------------------------
# Extracting a single percentile
tdPercentiles(model12_5, n = 0.01)
# Extracting a sequence of percentiles from 10% to 90% in steps of 10.
tdPercentiles(model12_5, n = seq(0.1, 0.9, 0.1))

## ----singlePdf-----------------------------------------------------------
tdPdfPlot(model12_5, S = 1, xVals = seq(0, 30, 0.01))

## ----multPdf-------------------------------------------------------------
# Extract the individual data
lobelia9_8 <- tdLobelia$clean[tdLobelia$clean$Temperature == 9.8, ]
lobelia16_7 <- tdLobelia$clean[tdLobelia$clean$Temperature == 16.7, ]
lobelia20_2 <- tdLobelia$clean[tdLobelia$clean$Temperature == 20.2, ]
lobelia24_3 <- tdLobelia$clean[tdLobelia$clean$Temperature == 24.3, ]
lobelia28_5 <- tdLobelia$clean[tdLobelia$clean$Temperature == 28.5, ]
lobelia32 <- tdLobelia$clean[tdLobelia$clean$Temperature == 32, ]

# Create the models
model9_8 <- timedist(lobelia9_8, x = "Day", y = "propMax", 
                     r = 0.1, c = 0.5, t = 25)
model16_7 <- timedist(lobelia16_7, x = "Day", y = "propMax", 
                      r = 0.1, c = 0.5, t = 10)
model20_2 <- timedist(lobelia20_2, x = "Day", y = "propMax", 
                      r = 0.1, c = 0.5, t = 10)
model24_3 <- timedist(lobelia24_3, x = "Day", y = "propMax", 
                      r = 0.1, c = 1, t = 5)
model28_5 <- timedist(lobelia28_5, x = "Day", y = "propMax", 
                      r = 0.1, c = 1, t = 5)
model32 <- timedist(lobelia32, x = "Day", y = "propMax", 
                    r = 0.1, c = 0.5, t = 5)

# Generate the plot
tdPdfPlot(model9_8, model12_5, model16_7, model20_2, model24_3, model28_5, 
          model32, 
          S = c(0.213, 0.307, 0.533, 0.707, 0.867, 0.907, 0.840), 
          xVals = seq(0, 30, 0.001))

## ----singleCdf-----------------------------------------------------------
tdCdfPlot(model12_5, S = 1, xVals = seq(0, 30, 0.01))
tdCdfPlot(model9_8, model12_5, model16_7, model20_2, model24_3, model28_5, 
          model32, 
          S = c(0.213, 0.307, 0.533, 0.707, 0.867, 0.907, 0.840), 
          xVals = seq(0, 30, 0.001))

