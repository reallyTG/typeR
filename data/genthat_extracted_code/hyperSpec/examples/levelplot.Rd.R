library(hyperSpec)


### Name: plotmap
### Title: Plot a Map and Identify/Select Spectra in the Map 'levelplot'
###   functions for hyperSpec objects.  An image or map of a summary value
###   of each spectrum is plotted. Spectra may be identified by mouse
###   click.
### Aliases: plotmap plotvoronoi levelplot,formula,hyperSpec-method
###   levelplot,hyperSpec,missing-method map.identify
###   levelplot,hyperSpec,missing-method levelplot,formula,hyperSpec-method
###   map.identify levelplot,hyperSpec,missing-method plotvoronoi
### Keywords: hplot

### ** Examples


## Not run: 
##D vignette (plotting)
##D vignette (hyperspec)
## End(Not run)

levelplot (spc ~ y * x, chondro [,,1003]) # properly rotated
plotmap (chondro [,,1003])

# plot spectra matrix
levelplot (spc ~ .wavelength * t, laser, contour = TRUE, col = "#00000080")
# see also plotmat

plotmap (chondro, clusters ~ x * y)

# Voronoi plots
smpl <- sample (chondro, 300)
plotmap (smpl, clusters ~ x * y)
if (require (tripack)) 
    plotvoronoi (smpl, clusters ~ x * y)
if (require (deldir)) 
    plotvoronoi (smpl, clusters ~ x * y,
                 use.tripack = FALSE)




