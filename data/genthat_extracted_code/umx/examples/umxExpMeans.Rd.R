library(umx)


### Name: umxExpMeans
### Title: Extract the expected means matrix from an 'mxModel'
### Aliases: umxExpMeans

### ** Examples

require(umx)
data(demoOneFactor)
latents  = c("G")
manifests = names(demoOneFactor)
m1 <- mxModel("One Factor", type = "RAM", 
	manifestVars = manifests, latentVars = latents, 
	mxPath(from = latents, to = manifests),
	mxPath(from = manifests, arrows = 2),
	mxPath(from = "one", to = manifests),
	mxPath(from = latents, arrows = 2, free = FALSE, values = 1.0),
	mxData(demoOneFactor[1:100,], type = "raw")
)
m1 = umxRun(m1, setLabels = TRUE, setValues = TRUE)
umxExpMeans(model = m1)
umxExpMeans(m1, digits = 3)



