library(EpiEstim)


### Name: Flu2009
### Title: Data on the 2009 H1N1 influenza pandemic in a school in
###   Pennsylvania
### Aliases: Flu2009
### Keywords: datasets

### ** Examples

		## load data on pandemic flu in a school in 2009
		data("Flu2009")

		## estimate the instantaneous reproduction number (method "NonParametricSI")
		EstimateR(Flu2009$Incidence, T.Start=2:26, T.End=8:32, method="NonParametricSI", 
			SI.Distr=Flu2009$SI.Distr, plot=TRUE, leg.pos=xy.coords(1,3))
		# the second plot produced shows, at each each day, 
		# the estimate of the instantaneous reproduction number over the 7-day window finishing on that day.

	


