library(smatr)


### Name: line.cis
### Title: Slope and elevation of a (standardised) major axis, with
###   confidence intervals
### Aliases: line.cis
### Keywords: models regression

### ** Examples

#load the leaflife data
data(leaflife)

#consider only the low rainfall sites:
leaf.low.rain=leaflife[leaflife$rain=='low',]

#estimate the SMA line for reserve vs coat
with(leaf.low.rain, line.cis(log10(longev),log10(lma)))

#produce CI's for MA slope and elevation:
with(leaf.low.rain, line.cis(log10(longev),log10(lma),method='MA'))



