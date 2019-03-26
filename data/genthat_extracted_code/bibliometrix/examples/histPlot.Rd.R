library(bibliometrix)


### Name: histPlot
### Title: Plotting historical co-citation network
### Aliases: histPlot

### ** Examples

# EXAMPLE Citation network

data(scientometrics)

histResults <- histNetwork(scientometrics, sep = ";")

net <- histPlot(histResults, n=20, size.cex=TRUE, size = 5, arrowsize=0.3)




