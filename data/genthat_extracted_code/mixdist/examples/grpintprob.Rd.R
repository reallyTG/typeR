library(mixdist)


### Name: grpintprob
### Title: Compute Probabilities of an Observation Falling into a Grouping
###   Interval
### Aliases: grpintprob
### Keywords: internal

### ** Examples

data(bindat)
data(binpar)
grpintprob(bindat, binpar, "binom", mixconstr(consigma = "BINOM", size = c(20, 20, 20, 20)))



