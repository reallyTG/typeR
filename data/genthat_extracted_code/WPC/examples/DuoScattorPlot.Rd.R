library(WPC)


### Name: DuoScattorPlot
### Title: Generate Scatter Plots for Time-to-Event and Biomarkers for Two
###   Groups
### Aliases: DuoScattorPlot
### Keywords: Data Scattor Plot

### ** Examples

	## Create two data objects for the function:
	
        ## Don't show: 
data(wpcdata.data)
## End(Don't show)
	tmppb = wpcdata[wpcdata$ATRT=="Placebo",]
	tmptrt = wpcdata[wpcdata$ATRT=="Treatment",]
	o.data1 =data.frame(event=tmppb$OSday, censor=tmppb$OScensor, marker=tmppb$Biomarker1)
	o.data2 =data.frame(event=tmptrt$OSday, censor=tmptrt$OScensor, marker=tmptrt$Biomarker1)
	
        ## Draw the scattor plot for the three data objects:

	DuoScattorPlot(o.data1,o.data2,180,xlab=c("Marker"),ylab=c("Survival Rate"),
		main=c("Weighted Predictiveness Curve"),ylim=c(0,600),xlim=c(0,100),
		col1="red",col2="black",lwd=2,pch1=20,pch2=21,legendloc="bottomright",ncol=1)



