library(WPC)


### Name: cox.wpc.est
### Title: Generate Weighted Predictiveness Curve Estimates Using
###   Parametric Approach.
### Aliases: cox.wpc.est
### Keywords: WPC Estimates

### ** Examples


	## install packages "survival" and "msm"
	
	library("survival")
	library("msm")

	cox.object = cox.wpc.est(event=wpcdata$OSday, censor=wpcdata$OScensor, 
	marker=wpcdata$Biomarker1,cutoff=180,quantile=0.95)
	
	print(cox.object)


