library(genridge)


### Name: pairs.ridge
### Title: Scatterplot Matrix of Bivariate Ridge Trace Plots
### Aliases: pairs.ridge
### Keywords: hplot

### ** Examples

longley.y <- longley[, "Employed"]
longley.X <- data.matrix(longley[, c(2:6,1)])

lambda <- c(0, 0.005, 0.01, 0.02, 0.04, 0.08)
lridge <- ridge(longley.y, longley.X, lambda=lambda)

pairs(lridge, radius=0.5, diag.cex=1.75)

if (require("ElemStatLearn")) {
	py <- prostate[, "lpsa"]
	pX <- data.matrix(prostate[, 1:8])
	pridge <- ridge(py, pX, df=8:1)
	
	pairs(pridge)
}




