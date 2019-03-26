library(OpenMx)


### Name: mxEvaluateOnGrid
### Title: Evaluate an algebra on an abscissa grid and collect column
###   results
### Aliases: mxEvaluateOnGrid

### ** Examples

library(OpenMx)

test2 <- mxModel("test2",
	mxMatrix(values=1.1, nrow=1, ncol=1, free=TRUE, name="thang"),
	mxMatrix(nrow=1, ncol=1, labels="abscissa1", free=TRUE, name="currentAbscissa"),
	mxMatrix(values=-2:2, nrow=1, ncol=5, name="abscissa",
		 dimnames=list(c('abscissa1'), NULL)),
	mxAlgebra(rbind(currentAbscissa + thang, currentAbscissa * thang), name="stuff"),
	mxAlgebra(mxEvaluateOnGrid(stuff, abscissa), name="grid"))
	
test2 <- mxRun(test2)
omxCheckCloseEnough(test2$grid$result, matrix(c(-1:3 + .1, -2:2 * 1.1), ncol=5, nrow=2,byrow=TRUE))



