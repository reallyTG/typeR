library(phylosim)


### Name: hasSiteSpecificParameter.Process
### Title: Check if a Process object has the site-process specific
###   parameter with the given id
### Aliases: hasSiteSpecificParameter.Process
###   Process.hasSiteSpecificParameter
###   hasSiteSpecificParameter,Process-method

### ** Examples

	# create a process object
	p<-Process()
	# check whether it has the "rate.multiplier" site-process specific paramter
	hasSiteSpecificParameter(p,"rate.multiplier");	# TRUE
	# check whether it has the "omega" site-process specific paramter
	hasSiteSpecificParameter(p,"omega");	# FALSE
 


