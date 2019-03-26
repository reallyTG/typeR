library(kinfit)


### Name: kinreport
### Title: Creates a report of the kinetic fits
### Aliases: kinreport
### Keywords: manip

### ** Examples

data(FOCUS_2006_A)
kinfits <- kinfit(FOCUS_2006_A)
kinobject <- list(
	parent = "Compound XY",
	type = "Degradation in the environment",
	system = "System 1",	
	data = FOCUS_2006_A,
	source = "Synthetic example data from FOCUS kinetics",
	fits = kinfits,
	results = kinresults(kinfits))	
kinreport(kinobject)



