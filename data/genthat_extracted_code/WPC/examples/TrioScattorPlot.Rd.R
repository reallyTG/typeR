library(WPC)


### Name: TrioScattorPlot
### Title: Generate Scatter Plots for Time-to-Event and Biomarkers for
###   Three Groups
### Aliases: TrioScattorPlot
### Keywords: Data Scattor Plot

### ** Examples

	## Create three data objects for the function:

	tmppb = wpcdata[wpcdata$TRTA=="Placebo",]
	tmptrt1 = wpcdata[wpcdata$TRTA=="LowDose",]
	tmptrt2 = wpcdata[wpcdata$TRTA=="HighDose",]
	o.data1 =data.frame(event=tmppb$OSday, censor=tmppb$OScensor, marker=tmppb$Biomarker1)
	o.data2 =data.frame(event=tmptrt1$OSday, censor=tmptrt1$OScensor, marker=tmptrt1$Biomarker1)
	o.data3 =data.frame(event=tmptrt2$OSday, censor=tmptrt2$OScensor, marker=tmptrt2$Biomarker1)
	
	## Draw the scattor plot for the three data objects:
	
	TrioScattorPlot(o.data1,o.data2,o.data3,180,xlab=c("Marker"),ylab=c("Surovival Rate"),
	main=c("Weighted Predictiveness Curve"),ylim=c(0,600),xlim=c(0,100),col1="red",
	col2="black",col3="blue",lwd=2,pch1=20,pch2=21,legendloc="bottomright",ncol=1)


