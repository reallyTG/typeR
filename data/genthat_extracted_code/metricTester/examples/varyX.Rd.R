library(metricTester)


### Name: varyX
### Title: Calculate alpha or beta metrics across a set of parameters
### Aliases: varyX

### ** Examples

#example of how to vary tree size
#not run
#system.time(temp <- varyX(alpha=TRUE, tree.size=c(59, 100),
#richness=40:59, delta=1,
#abundances=round(rlnorm(5000, meanlog=2, sdlog=1)) + 1, iterations=2))

#example of how to vary richness
#not run
#system.time(temp <- varyX(alpha=TRUE, tree.size=59,
#richness=list(30:39, 40:49), delta=1,
#abundances=round(rlnorm(5000, meanlog=2, sdlog=1)) + 1, iterations=2))

#example of how to vary tree shape
#not run
#system.time(temp <- varyX(alpha=TRUE, tree.size=59,
#richness=40:59, delta=c(0.1,10),
#abundances=round(rlnorm(5000, meanlog=2, sdlog=1)) + 1, iterations=2))

#example of how to vary abundance
#not run
#inputAbunds <- list(rep(2,5000), (round(rnorm(5000, 50, 15)) + 1),
#(round(rlnorm(5000, meanlog=2, sdlog=1)) + 1))

#system.time(temp <- varyX(alpha=TRUE, tree.size=59,
#richness=40:59, delta=1, abundances=inputAbunds, iterations=2))



