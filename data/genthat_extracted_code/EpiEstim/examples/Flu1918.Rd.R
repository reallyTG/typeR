library(EpiEstim)


### Name: Flu1918
### Title: Data on the 1918 H1N1 influenza pandemic in Baltimore
### Aliases: Flu1918
### Keywords: datasets

### ** Examples

		## load data on pandemic flu in Baltimore in 1918
		data("Flu1918")

		## estimate the instantaneous reproduction number (method "NonParametricSI")
		EstimateR(Flu1918$Incidence, T.Start=2:86, T.End=8:92, method="NonParametricSI", 
			SI.Distr=Flu1918$SI.Distr, plot=TRUE, leg.pos=xy.coords(60,2.5))
		# the second plot produced shows, at each each day, 
		# the estimate of the instantaneous reproduction number over the 7-day window finishing on that day.

	


