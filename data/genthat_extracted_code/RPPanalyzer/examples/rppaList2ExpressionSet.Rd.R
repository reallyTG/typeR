library(RPPanalyzer)


### Name: rppaList2ExpressionSet
### Title: Convert RPPA data into Expression Set
### Aliases: rppaList2ExpressionSet
### Keywords: manip

### ** Examples

	library(RPPanalyzer)
	data(dataI)
   dataI_bgcorr <- correctBG(dataI,method="normexp")
	dataI_median <- sample.median(dataI_bgcorr)
	expr.set <- rppaList2ExpressionSet(dataI_median)
    


