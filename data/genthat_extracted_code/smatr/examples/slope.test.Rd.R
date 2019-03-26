library(smatr)


### Name: slope.test
### Title: One-sample test of a (standardised) major axis slope
### Aliases: slope.test
### Keywords: htest

### ** Examples

#load the leaflife dataset:
data(leaflife)

#consider only the low rainfall sites:
leaf.low.rain <- leaflife[leaflife$rain=='low',]

#test if the SMA slope amongst species at low rainfall sites is 1,
#for log (base 10) transformed data:
with(leaf.low.rain, slope.test(log10(longev), log10(lma)))
    
#test if the MA slope is 2/3
with(leaf.low.rain, slope.test(log10(longev), log10(lma), test.value = 2/3, method = 'MA'))



