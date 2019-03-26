library(RPPanalyzer)


### Name: simpleBoxplot
### Title: Draws boxplots of groups of an RPPA data set.
### Aliases: simpleBoxplot
### Keywords: hplot

### ** Examples

library(RPPanalyzer)
	
data(dataIII)
dataIII_median <- sample.median(dataIII)
simpleBoxplot(x=dataIII_median, param="rank", 
	orderGrp=c("vx","zx","yzr","rxi"), file="simpleBoxplot.pdf")
    


