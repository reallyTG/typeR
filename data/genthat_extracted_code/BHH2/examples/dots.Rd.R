library(BHH2)


### Name: dots
### Title: Dots display
### Aliases: dots
### Keywords: aplot hplot

### ** Examples

library(BHH2)
set.seed(4)
# Defines the height of the plot area between c(0,1)
dotPlot(rnorm(100),xlab="x")

x <- rnorm(100)

# plots (possibly) overlapping points at y=0.3
dots(x,y=0.3)
# plots (possibly) overlapping points at y=0.4
dots(x,y=0.4,stacked=TRUE,base=FALSE)
# plots (hopefully) stacked points at y=0.5 allowing the dots to as high as 0.9
dots(x,y=0.5,stacked=TRUE,base=FALSE,hmax=.9)



