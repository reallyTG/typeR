library(WPC)


### Name: SoloScattorPlot
### Title: Generate Scatter Plots for Time-to-Event and Biomarkers for One
###   Group
### Aliases: SoloScattorPlot
### Keywords: Data Scattor Plot

### ** Examples

	## Create the data object for the function

	o.data = data.frame(event=wpcdata$OSday, censor=wpcdata$OScensor, marker=wpcdata$Biomarker1)

	## Print out the figure:
	
	SoloScattorPlot(o.data,180,xlab=c("Marker"),ylab=c("Survival Rate"),
			main=c("Weighted Predictiveness Curve"),ylim=c(0,600),xlim=c(0,100),
			col1="red",col2="red",lwd=2,pch1=20,pch2=21,legendloc="bottomright",ncol=1)


