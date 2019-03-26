library(BHH2)


### Name: dotPlot
### Title: Dot plot: scatter plot with stacked dots similar to the
###   stem-and-leaf plot
### Aliases: dotPlot
### Keywords: hplot

### ** Examples

library(BHH2)
data(tab03B1)
attach(tab03B1)
stem(yield) #stem-leaf plot
plt <- dotPlot(yield) # equivalent dotPlot

# same dot plot with max and min observations labelled
plt <- dotPlot(yield,xlim=c(75,95),xlab="yield",pch.size="x",hcex=1)
text(c(min(yield),max(yield),80),rep(0.05,3),c("min","max",80))
segments(80,min(plt$y),80,max(plt$y),lty=2)
detach()



