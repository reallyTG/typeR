library(adegraphics)


### Name: s1d.interval
### Title: 1-D plot of the interval between two numeric scores
### Aliases: s1d.interval
### Keywords: aplot hplot

### ** Examples

set.seed(40)
sc1 <- rnorm(10)
sc2 <- rnorm(10)
s1d.interval(sc1, sc2, method = "bars")
s1d.interval(sc1, sc2, method = "area")



