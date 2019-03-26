library(DRaWR)


### Name: DRaWR
### Title: DRaWR
### Aliases: DRaWR
### Keywords: random restart walk with

### ** Examples

DRaWR(possetfile = system.file("extdata", "sample.setlist", package="DRaWR"),
	unifile = system.file("extdata", "sample.uni", package="DRaWR"),
	networkfile = system.file("extdata", "sample.edge", package="DRaWR"),
	outdir = "output_", restarts = c(.7), nfolds = 1, st2keep = 1,
	undirected = TRUE, unweighted = FALSE, normalize = "type", maxiters = 50,
	thresh = 0.0001, property_types = c("T1", "T2"), writepreds = 0)



