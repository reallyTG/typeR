library(EpiEstim)


### Name: WT
### Title: Estimation of the case reproduction number using the Wallinga
###   and Teunis method
### Aliases: WT
### Keywords: distribution

### ** Examples

## load data on pandemic flu in a school in 2009
data("Flu2009")

## estimate the case reproduction number (method "NonParametricSI")
WT(Flu2009$Incidence, T.Start=2:26, T.End=8:32, method="NonParametricSI", 
    SI.Distr=Flu2009$SI.Distr, plot=TRUE, leg.pos=xy.coords(1,1.75), nSim=100)
# the second plot produced shows, at each each day, 
# the estimate of the cqse reproduction number over the 7-day window finishing on that day.

## estimate the case reproduction number (method "ParametricSI")
WT(Flu2009$Incidence, T.Start=2:26, T.End=8:32, method="ParametricSI", 
    Mean.SI=2.6, Std.SI=1.5, plot=TRUE, nSim=100)
# the second plot produced shows, at each each day, 
# the estimate of the cqse reproduction number over the 7-day window finishing on that day.




