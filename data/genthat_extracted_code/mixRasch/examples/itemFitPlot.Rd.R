library(mixRasch)


### Name: itemFitPlot
### Title: Function for producing item difficulty by fit statistic plots.
### Aliases: itemFitPlot
### Keywords: misc

### ** Examples


# Example data included with mixRasch
data(exRasch)

rasch1 <- mixRasch(exRasch,1,50, conv.crit=.0001, n.c=1)

# Default Fit Plot
itemFitPlot(rasch1)

# Using Outfit and a color theme
itemFitPlot(rasch1, fitStat="outfit", colTheme="spartans")




