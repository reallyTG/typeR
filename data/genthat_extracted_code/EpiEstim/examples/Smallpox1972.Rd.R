library(EpiEstim)


### Name: Smallpox1972
### Title: Data on the 1972 smallpox epidemic in Kosovo
### Aliases: Smallpox1972
### Keywords: datasets

### ** Examples

		## load data on smallpox in Kosovo in 1972
		data("Smallpox1972")

		## estimate the instantaneous reproduction number (method "NonParametricSI")
		EstimateR(Smallpox1972$Incidence, T.Start=27:51, T.End=33:57, method="NonParametricSI", 
			SI.Distr=Smallpox1972$SI.Distr, plot=TRUE, leg.pos=xy.coords(1,15))
		# the second plot produced shows, at each each day, 
		# the estimate of the instantaneous reproduction number over the 7-day window finishing on that day.

	


