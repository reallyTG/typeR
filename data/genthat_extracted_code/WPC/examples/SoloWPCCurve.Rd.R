library(WPC)


### Name: SoloWPCCurve
### Title: Generate Single Weighted Predictiveness Curve in Graph
### Aliases: SoloWPCCurve
### Keywords: WPC Graph

### ** Examples

	# Get the estimate of predictiveness curve from npr.wpc.est functions 
	# and print the corresponding predictiveness curve

	npr.object = npr.wpc.est(event=wpcdata$OSday, censor=wpcdata$OScensor, 
	marker=wpcdata$Biomarker1,cutoff=180,method="number.subjt",weights="normal",
	nsub=10,sspeed=1,df=2,confi="NO")

	SoloWPCCurve(npr.object,xlab="Marker",ylab="Survival Rate",
	main="Weighted Predictiveness Curve",ylim=c(0,1),xlim=c(0,100),
	type="l",col="red",lwd=2,confi="N",ptsest="Y")
	
	# Get the estimate of predictiveness curve from cox.wpc.est functions 
	# and print the corresponding predictiveness curve 

	cox.object = cox.wpc.est(event=wpcdata$OSday, censor=wpcdata$OScensor, 
	marker=wpcdata$Biomarker1,cutoff=180,quantile=0.95)
	
	SoloWPCCurve(cox.object,xlab="Marker",ylab="Survival Rate",
	main="Weighted Predictiveness Curve",ylim=c(0,1),xlim=c(0,100),
	type="l",col="red",lwd=2,confi="N",ptsest="Y")




