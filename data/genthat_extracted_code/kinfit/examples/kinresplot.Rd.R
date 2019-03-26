library(kinfit)


### Name: kinresplot
### Title: Creates a plot of the residual for specified kinetic fits
### Aliases: kinresplot
### Keywords: hplot

### ** Examples

data(FOCUS_2006_C)
kinfits <- kinfit(FOCUS_2006_C)
kinobject <- list(
	parent = "Compound XY",
	type = "Degradation in the environment",
	system = "System 1",	
	source = "Synthetic example data from FOCUS kinetics",
	data = FOCUS_2006_C,
	fits = kinfits,
	results = kinresults(kinfits))	
## Not run: kinresplot(kinobject, "SFO")



