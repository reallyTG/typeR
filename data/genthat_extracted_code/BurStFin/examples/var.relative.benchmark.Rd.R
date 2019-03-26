library(BurStFin)


### Name: var.relative.benchmark
### Title: Transform a Variance Matrix to be Relative to a Benchmark
### Aliases: var.relative.benchmark
### Keywords: multivariate

### ** Examples

var.orig <- array(c(400, 32, 24, 32, 64, 9.6, 24, 9.6, 144), c(3,3),
	list(c("equities", "bonds", "commodities"), 
	c("equities", "bonds", "commodities")))
var.aa <- var.add.benchmark(var.orig, c(equities=.6, bonds=.4), "e60b40")

var.rel <- var.relative.benchmark(var.aa, "e60b40")



