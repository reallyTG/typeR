library(umx)


### Name: umx_is_endogenous
### Title: umx_is_endogenous
### Aliases: umx_is_endogenous

### ** Examples

require(umx)
data(demoOneFactor)
m1 <- umxRAM("One Factor", data = mxData(cov(demoOneFactor), type = "cov", numObs = 500),
	umxPath("g", to = names(demoOneFactor)),
	umxPath(var = "g", fixedAt = 1),
	umxPath(var = names(demoOneFactor))
)
umx_is_endogenous(m1, manifests_only = TRUE)
umx_is_endogenous(m1, manifests_only = FALSE)



