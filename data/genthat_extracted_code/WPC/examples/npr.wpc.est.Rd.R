library(WPC)


### Name: npr.wpc.est
### Title: Generate Weighted Predictiveness Curve Estimates Using
###   Non-Parametric Approach.
### Aliases: npr.wpc.est
### Keywords: WPC Estimates

### ** Examples


	## install packages "survival" and "msm"
	
	library("survival")
	library("msm")



	## Fixed 10 subjects within each window and window sliding step is 1, 
	## normal weight function is used:
	
	npr.object1 = npr.wpc.est(event=wpcdata$OSday, censor=wpcdata$OScensor, 
	marker=wpcdata$Biomarker1,cutoff=180,method="number.subjt",weights="normal",
	nsub=10,sspeed=1,df=2,confi="NO")
	print(npr.object1)
	
	## Fixed biomarker scale window width 10 and window sliding step is 1, 
	## huber weight function is used:	
	
	## Not run: 
##D npr.object2 = npr.wpc.est(event=wpcdata$OSday, censor=wpcdata$OScensor, 
##D 	marker=wpcdata$Biomarker1,cutoff=180,method="window.width",weights="huber",
##D 	wdth=10,sspeed=1, df=2, confi="YES", nbtsp=100)
##D 	print(npr.object2)
## End(Not run)


