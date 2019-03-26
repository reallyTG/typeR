library(RPPanalyzer)


### Name: rppa2boxplot
### Title: Draws boxplots of groups of an RPPA data set including wilcox or
###   kruskal test.
### Aliases: rppa2boxplot
### Keywords: hplot

### ** Examples

library(RPPanalyzer)
	
data(dataIII)
dataIII_median <- sample.median(dataIII)
rppa2boxplot(x=dataIII_median, param="rank", control="vx",
	orderGrp=c("vx","zx","yzr","rxi"), file="wilcoxonBoxplot.pdf")
rppa2boxplot(x=dataIII_median, param="rank", control=NULL,
	orderGrp=c("vx","zx","yzr","rxi"), file="kruskalBoxplot.pdf")



