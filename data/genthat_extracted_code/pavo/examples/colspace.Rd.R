library(pavo)


### Name: colspace
### Title: Model spectra in a colorspace
### Aliases: colspace

### ** Examples

## Not run: 
##D data(flowers)
##D 
##D # A dichromat in a segment colourspace
##D vis.flowers <- vismodel(flowers, visual = 'canis')
##D di.flowers <- colspace(vis.flowers, space = 'di')
##D 
##D # Honeybee in the colour hexagon
##D vis.flowers <- vismodel(flowers, visual = 'apis', qcatch = 'Ei', relative = FALSE,
##D                         vonkries = TRUE, achro = 'l', bkg = 'green')
##D hex.flowers <- colspace(vis.flowers, space = 'hexagon')
##D 
##D # A trichromat in a Maxwell triangle
##D vis.flowers <- vismodel(flowers, visual = 'apis')
##D tri.flowers <- colspace(vis.flowers, space = 'tri')
##D plot(tri.flowers)
##D 
##D # A tetrachromat in a tetrahedral colourspace
##D vis.flowers <- vismodel(flowers, visual = 'bluetit')
##D tcs.flowers <- colspace(vis.flowers, space = 'tcs')
##D 
##D # A housefly in the categorical colourspace
##D vis.flowers <- vismodel(flowers, visual = 'musca', achro = 'md.r1')
##D cat.flowers <- colspace(vis.flowers, space = 'categorical')
## End(Not run)




