library(phyloclim)


### Name: plotAncClim
### Title: Chronograms with Climatic Data on the Y-Axis
### Aliases: plotAncClim

### ** Examples

 # load phylogeny and PNOs of Oxalis sect. Palmatifoliae
 data(tree)
 data(PNO)

# choose summer precipitation for analysis
clim <- PNO$PrecipitationWarmestQuarter

# estimate ancestral tolerances
ac <- anc.clim(target = tree, pno = clim, n = 100)

# visualize results with default branch coloration
plotAncClim(ac)

# alternative clade colors are given according to the order
# in which tip labels appear from left to right
plotAncClim(ac, col = c("red", "purple", "blue"))

# the 'tipmode' argument
plotAncClim(ac, tipmode = 0)
plotAncClim(ac, tipmode = 1)
plotAncClim(ac, tipmode = 2, nchar = 5)
plotAncClim(ac, tipmode = 3, nchar = 4)



