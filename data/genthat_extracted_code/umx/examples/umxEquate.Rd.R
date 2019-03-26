library(umx)


### Name: umxEquate
### Title: umxEquate: Equate two or more paths
### Aliases: umxEquate

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
# By default, umxEquate just equates master and slave labels
m2 = umxEquate(m1, master = "G_to_x1", slave = "G_to_x2", name = "Eq x1 x2 loadings")
# Set autoRun = TRUE and comparison = TRUE to run and output a comparison
m2 = umxEquate(m1, autoRun = TRUE, comparison = TRUE, name = "Eq x1 x2",
	     master = "G_to_x1", slave = "G_to_x2"
)



