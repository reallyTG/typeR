library(tigerstats)


### Name: qnormGC
### Title: Graphical Calculator for Normal Curve Percentiles
### Aliases: qnormGC

### ** Examples

#80th percentile of a normal distribution with mean=70 and sd=4:
qnormGC(0.80,region="below",mean=70,sd=4)

#Return value x so that P(X > x) = 0.10 (same as the 90th percentile)
qnormGC(0.10,region="above",mean=70,sd=4)

#This gives the multiplier for 95%-confidence intervals based on the z-statistic
qnormGC(0.95,region="between")

#This gives critical values for a two-sided z-test with alpha = 0.01:
qnormGC(0.01,region="outside")



