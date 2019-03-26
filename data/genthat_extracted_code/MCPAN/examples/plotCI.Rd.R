library(MCPAN)


### Name: plotCI
### Title: Plot confidence intervals
### Aliases: plotCI plotCI.default plotCI.sci plotCI.sci.ratio
###   plotCI.confint.glht
### Keywords: hplot

### ** Examples


x=c(8,9,9,18,39,44)
n=c(2000,2000,2000,2000,2000,2000)

x<-binomORci(x=x, n=n, names=c("0","120","240","480","600","720"))

plotCI(x, lines=1)





