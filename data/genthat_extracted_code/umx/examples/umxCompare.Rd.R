library(umx)


### Name: umxCompare
### Title: Print a comparison table of one or more 'mxModel's, formatted
###   nicely.
### Aliases: umxCompare

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
m2 = umxModify(m1, update = "G_to_x2", name = "drop_path_2_x2")
umxCompare(m1, m2)
umxCompare(m1, m2, report = "report") # Add English-sentence descriptions
## Not run: 
##D umxCompare(m1, m2, report = "html") # Open table in browser
## End(Not run)
m3 = umxModify(m2, update = "G_to_x3", name = "drop_path_2_x2_and_3")
umxCompare(m1, c(m2, m3))
umxCompare(m1, c(m2, m3), compareWeightedAIC = TRUE)
umxCompare(c(m1, m2), c(m2, m3), all = TRUE)



