library(RcmdrPlugin.SCDA)


### Name: RcmdrSCDAPlugin-package
### Title: Install the SCDA Rcmdr Plug-In
### Aliases: RcmdrSCDAPlugin-package RcmdrSCDAPlugin
### Keywords: package

### ** Examples

scores <- c(10,9,8,10,7,2,5,3,4,5) # Example data
labels <- c("A","A","A","A","A","B","B","B","B","B")
d <- data.frame(labels, scores)
graph(design="AB", data=d)
pvalue.systematic(design="AB", data=d, limit=1, statistic="A-B")



