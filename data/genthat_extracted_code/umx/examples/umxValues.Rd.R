library(umx)


### Name: umxValues
### Title: umxValues: Set values in RAM model, matrix, or path
### Aliases: umxValues

### ** Examples

require(umx)
data(demoOneFactor)
latents = c("G")
manifests = names(demoOneFactor)
m1 <- mxModel("One Factor", type = "RAM", 
	manifestVars = manifests, latentVars = latents, 
	mxPath(from = latents, to = manifests),
	mxPath(from = manifests, arrows = 2),
	mxPath(from = latents, arrows = 2, free = FALSE, values = 1.0),
	mxData(cov(demoOneFactor), type = "cov", numObs = 500)
)
mxEval(S, m1) # default variances are 0
m1 = umxValues(m1)
mxEval(S, m1) # plausible variances
umx_print(mxEval(S,m1), 3, zero.print = ".") # plausible variances
umxValues(14, sd = 1, n = 10) # Return vector of length 10, with mean 14 and sd 1



