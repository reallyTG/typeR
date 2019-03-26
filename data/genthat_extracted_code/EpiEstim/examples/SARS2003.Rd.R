library(EpiEstim)


### Name: SARS2003
### Title: Data on the 2003 SARS epidemic in Hong Kong
### Aliases: SARS2003
### Keywords: datasets

### ** Examples

		## load data on SARS in Hong Kong in 2003
		data("SARS2003")

		## estimate the instantaneous reproduction number (method "NonParametricSI")
		EstimateR(SARS2003$Incidence, T.Start=14:101, T.End=20:107, method="NonParametricSI", 
			SI.Distr=SARS2003$SI.Distr, plot=TRUE, leg.pos=xy.coords(1,7))
		# the second plot produced shows, at each each day, 
		# the estimate of the instantaneous reproduction number over the 7-day window finishing on that day.

	


