library(RadOnc)


### Name: plot-methods
### Title: Additional Methods for Function 'plot' in Package 'graphics'
### Aliases: plot-methods plot,ANY,ANY-method plot,DVH.list,ANY-method
###   plot,DVH.list,missing-method plot,DVH,ANY-method plot,DVH,DVH-method
###   plot,DVH,missing-method plot,zDVH,ANY-method plot,zDVH,DVH-method
###   plot,DVH,zDVH-method plot,zDVH,zDVH-method plot.DVH plot.DVH.list
###   plot.zDVH plot,zDVH,missing-method
### Keywords: methods aplot

### ** Examples

	# plot(x, ..., plot.type="individual")
	OARs <- c("LIVER","STOMACH","DUODENUM")
	cols <- c("red", "darkgreen", "blue")
	plot(johndoe[OARs], col=cols, lty=1:3, legend="topright", legend.labels=OARs, main="OARs")
	
	# plot(x, ..., plot.type="bars")
	plot(janedoe[2:9], plot.type="bars", volume="absolute",dose="relative")
	
	# plot(x, ..., plot.type="grouped")
	plot(c(johndoe["STOMACH"],janedoe["STOMACH"]), #group 1
		c(johndoe[c("CTV","PTV")],janedoe[c("CTV","PTV")]), #group 2
		c(janedoe["LIVER"],johndoe["LIVER"]), #group 3
		c(johndoe["DUODENUM"],janedoe["DUODENUM"]), #group 4
		plot.type="grouped", col=c("orange","green","blue","red"), lwd=2, dose="relative")
		
	# plot(x, ..., plot.type="ttest")
	# OARs <- c("LIVER", "STOMACH", "SMALL_BOWEL")
	# plot(c(johndoe[c("CTV","PTV")],janedoe[c("CTV","PTV")]), #group 1
	#	c(janedoe[OARs],johndoe[OARs]), #group 2
 	#	plot.type="t", col=c("red", "blue"), lty=2, fill.lty=1, main="Target v. OAR t-Test")
 		
	# plot(x, ..., plot.type="wilcox")
	# plot(c(johndoe[c("CTV","PTV")],janedoe[c("CTV","PTV")]), #group 1
	#	c(janedoe[OARs],johndoe[OARs]), #group 2
 	#	plot.type="w", col=c("red", "blue"), lty=2, fill.lty=1, main="Target v. OAR",
 	#	panel.lower="grouped")
 	
 	# plot(x, ..., plot.type="correlation")
	# plot(janedoe, sample(1:100, 10), plot.type="correlation", method="kendall")
	



