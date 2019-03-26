library(umx)


### Name: umxGetParameters
### Title: Get parameters from a model, with support for pattern matching!
### Aliases: umxGetParameters

### ** Examples

require(umx)
data(demoOneFactor)
latents  = c("G")
manifests = names(demoOneFactor)
m1 <- umxRAM("One Factor", data = mxData(cov(demoOneFactor), type = "cov", numObs = 500),
	umxPath(latents, to = manifests),
	umxPath(var = manifests),
	umxPath(var = latents, fixedAt = 1)
)

# Show all parameters
umxGetParameters(m1)
umxGetParameters(m1, free = TRUE) # only parameters which are free 
umxGetParameters(m1, free = FALSE) # only parameters which are fixed
# Complex regex patterns
umxGetParameters(m1, regex = "x[1-3]_with_x[2-5]", free = TRUE)




