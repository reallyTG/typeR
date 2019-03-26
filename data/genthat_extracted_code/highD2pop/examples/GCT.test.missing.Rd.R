library(highD2pop)


### Name: GCT.test.missing
### Title: Generalized component test for missing data
### Aliases: GCT.test.missing
### Keywords: htest multivariate

### ** Examples


	data(chr1qseg)

	X <- chr1qseg$X
	Y <- chr1qseg$Y
	
	GCT.test.missing(X,Y,r=20,smoother="parzen")




