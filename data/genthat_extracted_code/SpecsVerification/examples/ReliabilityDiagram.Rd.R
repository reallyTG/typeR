library(SpecsVerification)


### Name: ReliabilityDiagram
### Title: Reliability diagram for probability forecasts
### Aliases: ReliabilityDiagram

### ** Examples

data(eurotempforecast)
p <- rowMeans(ens.bin)
ReliabilityDiagram(p, obs.bin, plot=TRUE)



