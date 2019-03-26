library(PresenceAbsence)


### Name: calibration.plot
### Title: Calibration Plot
### Aliases: calibration.plot
### Keywords: models

### ** Examples

data(SIM3DATA)

calibration.plot(SIM3DATA)

calibration.plot(	DATA=SIM3DATA,
			which.model=3,
			na.rm=TRUE,
			alpha=0.05,
			N.bins=10,
			xlab="Predicted Probability of Occurence",
			ylab="Observed occurence as proportion of sites surveyed",
			model.names=NULL,
			main=NULL)



