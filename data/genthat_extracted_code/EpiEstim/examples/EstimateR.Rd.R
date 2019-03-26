library(EpiEstim)


### Name: EstimateR
### Title: Estimation of the instantaneous reproduction number
### Aliases: EstimateR
### Keywords: distribution

### ** Examples

## load data on pandemic flu in a school in 2009
data("Flu2009")

## estimate the instantaneous reproduction number (method "NonParametricSI")
EstimateR(Flu2009$Incidence, T.Start=2:26, T.End=8:32, method="NonParametricSI", 
    SI.Distr=Flu2009$SI.Distr, plot=TRUE, leg.pos=xy.coords(1,3))
# the second plot produced shows, at each each day, 
# the estimate of the instantaneous reproduction number over the 7-day window finishing on that day.

## estimate the instantaneous reproduction number (method "ParametricSI")
EstimateR(Flu2009$Incidence, T.Start=2:26, T.End=8:32, method="ParametricSI", 
    Mean.SI=2.6, Std.SI=1.5, plot=TRUE)
# the second plot produced shows, at each each day, 
# the estimate of the instantaneous reproduction number over the 7-day window finishing on that day.

## estimate the instantaneous reproduction number (method "UncertainSI")
EstimateR(Flu2009$Incidence, T.Start=2:26, T.End=8:32, method="UncertainSI", 
    Mean.SI=2.6, Std.Mean.SI=1, Min.Mean.SI=1, Max.Mean.SI=4.2, 
    Std.SI=1.5, Std.Std.SI=0.5, Min.Std.SI=0.5, Max.Std.SI=2.5, 
    n1=100, n2=100, plot=TRUE)
# the bottom left plot produced shows, at each each day, 
# the estimate of the instantaneous reproduction number over the 7-day window finishing on that day.




