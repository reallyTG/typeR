library(PMCMRplus)


### Name: barPlot
### Title: Plotting PMCMR Objects
### Aliases: barPlot
### Keywords: plot

### ** Examples

## data set chickwts
ans <- tukeyTest(weight ~ feed, data = chickwts)
barPlot(ans)



