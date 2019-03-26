library(WPC)


### Name: ww.windows
### Title: Create a Series of Overlapping Windows by Fixing Biomarker Scale
###   Window Width
### Aliases: ww.windows
### Keywords: WPC Estimates Local Assessment

### ** Examples

	
	## Window width is specified as 10 and window sliding step is 1:

	
	object = ww.windows(event=wpcdata$OSday, censor=wpcdata$OScensor, 
	marker=wpcdata$Biomarker1, wdth=10, sspeed=1)

	print(object)


