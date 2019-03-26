library(pals)


### Name: penobscot
### Title: Seismic data horizon offshore of Nova Scotia.
### Aliases: penobscot
### Keywords: datasets

### ** Examples

# 
data(penobscot)

# Hall used cubehelix palette
# http://wiki.seg.org/wiki/Smoothing_surfaces_and_attributes#External_links
image(penobscot, col=rev(cubehelix(99)))

# Niccoli suggested LinearL palette
# http://wiki.seg.org/wiki/How_to_evaluate_and_compare_color_maps
image(penobscot, col=linearl(99))

# Use this version to get a colorkey
# library(lattice)
# levelplot(penobscot, col.regions=rev(cubehelix(99)), 
#   cuts=97, asp=0.7, scale=list(draw=FALSE))




