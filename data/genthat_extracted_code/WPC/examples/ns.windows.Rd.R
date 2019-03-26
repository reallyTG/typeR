library(WPC)


### Name: ns.windows
### Title: Create a Series of Overlapping Windows by Fixing Number of
###   Patients within each Window
### Aliases: ns.windows
### Keywords: WPC Estimates Local Assessment

### ** Examples


	## Window width is specified as 10 and window sliding step is 1:

	object = ns.windows(event=wpcdata$OSday, censor=wpcdata$OScensor, 
	marker=wpcdata$Biomarker1, nsub=10, sspeed=1)
	print(object)


