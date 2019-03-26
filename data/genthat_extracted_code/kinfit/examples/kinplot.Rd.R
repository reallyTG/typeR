library(kinfit)


### Name: kinplot
### Title: Creates a plot of the kinetic fits
### Aliases: kinplot
### Keywords: hplot

### ** Examples

data(FOCUS_2006_C)
kinfits <- kinfit(FOCUS_2006_C, kinmodels = c("SFO", "FOMC", "DFOP"))
kinobject <- list(
	parent = "Compound XY",
	type = "Degradation in the environment",
	system = "System 1",	
	source = "Synthetic example data from FOCUS kinetics",
	data = FOCUS_2006_C,
	fits = kinfits,
	results = kinresults(kinfits))	
## Not run: kinplot(kinobject)



