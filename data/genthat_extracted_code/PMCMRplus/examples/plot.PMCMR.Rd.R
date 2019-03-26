library(PMCMRplus)


### Name: plot.PMCMR
### Title: Plotting PMCMR Objects
### Aliases: plot.PMCMR
### Keywords: plot

### ** Examples

## data set InsectSprays
ans <- kwAllPairsNemenyiTest(count ~ spray, data = InsectSprays)
plot(ans)
plot(ans, col="red",main="My title", xlab="Spray", "Count")



