library(umx)


### Name: umx_fix_latents
### Title: umx_fix_latents
### Aliases: umx_fix_latents

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
umx_show(m1, matrices = "S") # variance of g is not set
m1 = umx_fix_latents(m1)
umx_show(m1, matrices = "S") # variance of g is fixed at 1



