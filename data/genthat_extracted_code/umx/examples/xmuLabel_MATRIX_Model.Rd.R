library(umx)


### Name: xmuLabel_MATRIX_Model
### Title: xmuLabel_MATRIX_Model (not a user function)
### Aliases: xmuLabel_MATRIX_Model

### ** Examples

require(umx)
data(demoOneFactor)
m2 <- mxModel("One Factor",
	mxMatrix("Full", 5, 1, values = 0.2, free = TRUE, name = "A"), 
	mxMatrix("Symm", 1, 1, values = 1.0, free = FALSE, name = "L"), 
	mxMatrix("Diag", 5, 5, values = 1.0, free = TRUE, name = "U"), 
	mxAlgebra(A %*% L %*% t(A) + U, name = "R"), 
	mxExpectationNormal("R", dimnames = names(demoOneFactor)),
	mxFitFunctionML(),
	mxData(cov(demoOneFactor), type = "cov", numObs = 500)
)
m3 = umx:::xmuLabel_MATRIX_Model(m2)
m4 = umx:::xmuLabel_MATRIX_Model(m2, suffix = "male")
# explore these with omxGetParameters(m4)



