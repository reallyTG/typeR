library(umx)


### Name: umxSetParameters
### Title: umxSetParameters: Set parameters in an mxModel
### Aliases: umxSetParameters

### ** Examples

require(umx)
data(demoOneFactor)
latents  = c("G")
manifests = names(demoOneFactor)
m1 <- umxRAM("One Factor", data = mxData(demoOneFactor[1:80,], type = "raw"),
	umxPath(from = latents, to = manifests),
	umxPath(v.m. = manifests),
	umxPath(v1m0 = latents)
)
parameters(m1)
umxSetParameters(m1, regex = "^", newlabels= "m1_", test = TRUE)
m2 = umxSetParameters(m1, "G_to_x1", newlabels= "G_to_x2", test = FALSE)
parameters(m2)



