library(umx)


### Name: umx_fix_first_loadings
### Title: umx_fix_first_loadings
### Aliases: umx_fix_first_loadings

### ** Examples

require(umx)
data(demoOneFactor)
m1 <- mxModel("One Factor", type = "RAM",
 manifestVars = names(demoOneFactor),
 latentVars = "g",
	mxPath(from = "g", to = names(demoOneFactor)),
	mxPath(from = names(demoOneFactor), arrows = 2),
	mxData(cov(demoOneFactor), type = "cov", numObs = 500)
)
m1 = umx_fix_first_loadings(m1)
umx_show(m1) # path from g to var1 fixed @ 1.



