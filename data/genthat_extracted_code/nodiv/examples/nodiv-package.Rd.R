library(nodiv)


### Name: nodiv-package
### Title: nodiv - Node-based analysis of species distributions
### Aliases: nodiv-package nodiv
### Keywords: package

### ** Examples

data(coquettes)
res <- Node_analysis(coquettes, 50, "rdtable")
par(mfrow = c(1,2))
plot(res)
plotSOS(res, 28, shapefill = terrain.colors(64))
summary(res)



