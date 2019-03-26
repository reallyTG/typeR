library(umx)


### Name: umxEval
### Title: umxEval
### Aliases: umxEval

### ** Examples

m1 = mxModel("fit",
	mxMatrix("Full", nrow = 1, ncol = 1, free = TRUE, values = 1, name = "a"), 
	mxMatrix("Full", nrow = 1, ncol = 1, free = TRUE, values = 2, name = "b"), 
	mxAlgebra(a %*% b, name = "ab"), 
	mxConstraint(ab == 35, name = "maxHours"), 
	mxFitFunctionAlgebra(algebra = "ab", numObs= NA, numStats = NA)
)
m1 = mxRun(m1)
mxEval(list(ab = ab), m1)



