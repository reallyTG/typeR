library(STAR)


### Name: mkCPSP
### Title: Counting Process Sample Paths
### Aliases: mkCPSP print.CountingProcessSamplePath
###   plot.CountingProcessSamplePath lines.CountingProcessSamplePath
###   as.CPSP
### Keywords: ts survival

### ** Examples

## A simple illustration with Ogata's hearthquakes data set
data(ShallowShocks)
plot(mkCPSP(ShallowShocks$Date),
     xlab="Time (days)",
     main="Shallow Shocks Counting Process of Ogata 1988")
## An illustration with on of STAR's data neuroanl dicharge data set
data(e060824spont)
## Create the object from a spikeTrain
n1spt.cp <- as.CPSP(e060824spont[["neuron 1"]])
## print it
n1spt.cp
## plot it
plot(n1spt.cp)



