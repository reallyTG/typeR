library(BHH2)


### Name: tab03B2
### Title: Table 3.3
### Aliases: tab03B2
### Keywords: datasets

### ** Examples

library(BHH2)
data(tab03B2)
attach(tab03B2)
# displays the differences as dot plot (similar to histograms)
plt <- dotPlot(diff10,xlim=2.55*c(-1,+1),xlab="differences")
segments(1.3,0,1.3,max(plt$y))  #vertical line at x=1.3
detach()



