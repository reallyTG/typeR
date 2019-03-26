library(RPPanalyzer)


### Name: sample.median
### Title: Aggregate the replicates in an RPPA data set
### Aliases: sample.median
### Keywords: manip

### ** Examples

	library(RPPanalyzer)
	
   data(dataI)
   dataI_bgcorr <- correctBG(dataI,method="normexp")
	
	data.median <- sample.median(dataI_bgcorr)



