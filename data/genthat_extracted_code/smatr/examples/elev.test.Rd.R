library(smatr)


### Name: elev.test
### Title: One-sample test of a (standardised) major axis elevation
### Aliases: elev.test
### Keywords: htest

### ** Examples

#load the leaflife dataset:
data(leaflife)

#consider only the low rainfall sites:
leaf.low.rain <-  subset(leaflife, rain=="low")

#construct a plot
plot(log10(leaf.low.rain$lma), log10(leaf.low.rain$longev),
   xlab="leaf mass per area [log scale]", ylab="leaf longevity [log scale]")
    
#test if the SMA elevation is 0 for leaf longevity vs LMA
with(leaf.low.rain, elev.test(log10(lma), log10(longev)))

#test if the MA elevation is 2
with(leaf.low.rain,elev.test(log10(lma), log10(longev),
   test.value = 2, method = "MA"))



