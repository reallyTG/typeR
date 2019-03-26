library(umx)


### Name: umx_parameters
### Title: Display path estimates from a model, filtering by name and
###   value.
### Aliases: umx_parameters umxParameters parameters

### ** Examples

require(umx)
data(demoOneFactor)
manifests = names(demoOneFactor)
m1 <- umxRAM("One Factor", data = mxData(demoOneFactor, type = "raw"),
	umxPath(from = "G", to = manifests),
	umxPath(v.m. = manifests),
	umxPath(v1m0 = "G")
)
# Parameters with values below .1
umx_parameters(m1, "below", .1)
# Parameters with values above .5
umx_parameters(m1, "above", .5)
# Parameters with values below .1 and containing "_to_" in their label
umx_parameters(m1, "below", .1, "_to_")



