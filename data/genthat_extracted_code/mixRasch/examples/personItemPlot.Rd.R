library(mixRasch)


### Name: personItemPlot
### Title: Function for producing back-to-back histograms of item and
###   person distributions.
### Aliases: personItemPlot
### Keywords: misc

### ** Examples


# Example data included with mixRasch
data(SimMix)

rasch1 <- mixRasch(SimMix,1,50, conv.crit=.0001, n.c=1)

personItemPlot(rasch1)




