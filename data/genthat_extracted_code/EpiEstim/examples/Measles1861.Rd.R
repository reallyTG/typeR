library(EpiEstim)


### Name: Measles1861
### Title: Data on the 1861 measles epidemic in Hagelloch, Germany
### Aliases: Measles1861
### Keywords: datasets

### ** Examples

		## load data on measles in Hallegoch in 1861
		data("Measles1861")

		## estimate the instantaneous reproduction number (method "NonParametricSI")
		EstimateR(Measles1861$Incidence, T.Start=17:42, T.End=23:48, method="NonParametricSI", 
			SI.Distr=Measles1861$SI.Distr, plot=TRUE, leg.pos=xy.coords(1,7))
		# the second plot produced shows, at each each day, 
		# the estimate of the instantaneous reproduction number over the 7-day window finishing on that day.

	


