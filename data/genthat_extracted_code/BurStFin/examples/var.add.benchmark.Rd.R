library(BurStFin)


### Name: var.add.benchmark
### Title: Expand a Variance Matrix to Include a Benchmark
### Aliases: var.add.benchmark
### Keywords: multivariate

### ** Examples

## Not run: 
##D varian.ben <- var.add.benchmark(varian, ftse.constituents, "ftse100")
## End(Not run)

var.orig <- array(c(400, 32, 24, 32, 64, 9.6, 24, 9.6, 144), c(3,3),
	list(c("equities", "bonds", "commodities"), 
	c("equities", "bonds", "commodities")))
var.aa <- var.add.benchmark(var.orig, c(equities=.6, bonds=.4), "e60b40")



