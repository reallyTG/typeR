library(QuantPsyc)


### Name: plotNorm
### Title: Normal Density Plot
### Aliases: plotNormX plotNormXm
### Keywords: distribution smooth

### ** Examples

#	plot.normX	
data(USJudgeRatings)	# data packaged with R
plotNormX(USJudgeRatings$CONT) 

# creates a pdf file that contains plots for all 12 variables in USJudgeRatings

#	plot.normXm	
data(USJudgeRatings)	
pdf("Judge.pdf")	#writes file to working directory 
plotNormXm(USJudgeRatings, 12) 
dev.off()



