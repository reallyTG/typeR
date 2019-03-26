library(WPC)


### Name: TrioWPCCurve
### Title: Generate Three Weighted Predictiveness Curves in Graph
### Aliases: TrioWPCCurve
### Keywords: WPC Graph

### ** Examples

	tmppb = wpcdata[wpcdata$TRTA=="Placebo",]
	tmptrt1 = wpcdata[wpcdata$TRTA=="LowDose",]
	tmptrt2 = wpcdata[wpcdata$TRTA=="HighDose",]
	o.data1 =data.frame(event=tmppb$OSday, censor=tmppb$OScensor, marker=tmppb$Biomarker1)
	o.data2 =data.frame(event=tmptrt1$OSday, censor=tmptrt1$OScensor, marker=tmptrt1$Biomarker1)
	o.data3 =data.frame(event=tmptrt2$OSday, censor=tmptrt2$OScensor, marker=tmptrt2$Biomarker1)
	
	## Not run: 
##D npr.object1 = npr.wpc.est(event=o.data1$event, censor=o.data1$censor, 
##D 	marker=o.data1$marker,cutoff=180,method="window.width",weights="huber",
##D 	wdth=10,sspeed=1, df=2, confi="YES", nbtsp=1000)
##D 	npr.object2 = npr.wpc.est(event=o.data2$event, censor=o.data2$censor,
##D 	marker=o.data2$marker,cutoff=180,method="window.width",weights="huber",
##D 	wdth=10,sspeed=1, df=2, confi="YES", nbtsp=1000)
##D 	npr.object3 = npr.wpc.est(event=o.data3$event, censor=o.data3$censor, 
##D 	marker=o.data3$marker,cutoff=180,method="window.width",weights="huber",
##D 	wdth=10,sspeed=1, df=2, confi="YES", nbtsp=1000)
##D 
##D 	TrioWPCCurve(npr.object1,npr.object2,npr.object3,xlab="Marker",ylab="Survival Rate",
##D 	main="Weighted Predictiveness Curve",ylim=c(0,1),xlim=c(0,100),type="l",col1="red",
##D 	col2="blue",col3="black",lwd=2,legendloc="bottomright",legendtxt=c("Method1",
##D 	"Method2","Method3"),confi="Y")
## End(Not run)


