library(phyloclim)


### Name: anc.clim
### Title: Estimation of Ancestral Climatic Tolerances
### Aliases: anc.clim

### ** Examples

# load phylogeny and PNOs of Oxalis sect. Palmatifoliae
data(tree)
data(PNO)

# choose summer precipitation for analysis
clim <- PNO$PrecipitationWarmestQuarter

# estimate ancestral tolerances
ac <- anc.clim(target = tree, pno = clim, n = 100)

# visualize results
plotAncClim(ac, ylab = "Precipitation of warmest quarter (mm)")



