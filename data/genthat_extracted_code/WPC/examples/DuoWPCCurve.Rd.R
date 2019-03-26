library(WPC)


### Name: DuoWPCCurve
### Title: Generate Two Weighted Predictiveness Curves in Graph
### Aliases: DuoWPCCurve
### Keywords: WPC Graph

### ** Examples

	# Get the estiamte of predictiveness curve from npr.wpc.est functions 
	
	npr.object = npr.wpc.est(event=wpcdata$OSday, censor=wpcdata$OScensor, 
	marker=wpcdata$Biomarker1,cutoff=180,method="number.subjt",weights="normal",
	nsub=10,sspeed=1,df=2,confi="NO")
	
	# Get the estiamte of predictiveness curve from cox.wpc.est functions 

	cox.object = cox.wpc.est(event=wpcdata$OSday, censor=wpcdata$OScensor, 
	marker=wpcdata$Biomarker1,cutoff=180,quantile=0.95)

	# Print Predictiveness Curve

	DuoWPCCurve(npr.object,cox.object,xlab="Marker",ylab="Survival Rate",
	main="Weighted Predictiveness Curve",ylim=c(0,1),xlim=c(0,100),type="l",
	col1="red",col2="blue",lwd=2,legendloc="bottomright",
	legendtxt=c("treatment","placebo"),confi="N", ptsest="N")


