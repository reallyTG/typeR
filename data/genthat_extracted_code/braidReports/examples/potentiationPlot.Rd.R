library(braidReports)


### Name: potentiationPlot
### Title: Plot Potentiation in a BRAID Fitted Combination
### Aliases: potentiationPlot
### Keywords: hplot

### ** Examples

data(es8analysis)
bfit <- es8analysis$braidFit
pcont <- list(xtrans=function(x) x*10^6,ytrans=function(y) 10^y,ylog=TRUE,thresh=-1)
potentiationPlot(bfit,c(0,10^-6,10^-5,10^-4),control=pcont)



