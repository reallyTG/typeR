library(pavo)


### Name: plot.colspace
### Title: Plot spectra in a colourspace
### Aliases: plot.colspace

### ** Examples

## Not run: 
##D data(flowers)
##D data(sicalis)
##D 
##D # Dichromat
##D vis.flowers <- vismodel(flowers, visual = 'canis')
##D di.flowers <- colspace(vis.flowers, space = 'di')
##D plot(di.flowers)
##D 
##D # Colour hexagon
##D vis.flowers <- vismodel(flowers, visual = 'apis', qcatch = 'Ei', relative = FALSE,
##D                         vonkries = TRUE, achro = 'l', bkg = 'green')
##D hex.flowers <- colspace(vis.flowers, space = 'hexagon')
##D plot(hex.flowers, sectors = 'coarse')
##D 
##D # Tetrahedron (static)
##D vis.sicalis <- vismodel(sicalis, visual = 'avg.uv')
##D tcs.sicalis <- colspace(vis.sicalis, space = 'tcs')
##D plot(tcs.sicalis)
##D 
##D # Tetrahedron (interactive)
##D vis.sicalis <- vismodel(sicalis, visual = 'avg.uv')
##D tcs.sicalis <- colspace(vis.sicalis, space = 'tcs')
##D tcsplot(tcs.sicalis, size = 0.005)
##D 
##D ## Add points to interactive tetrahedron
##D patch <- rep(c('C','T','B'), 7)
##D tcs.crown <- subset(tcs.sicalis, 'C')
##D tcs.breast <- subset(tcs.sicalis, 'B')
##D tcsplot(tcs.crown, col ='blue')
##D tcspoints(tcs.breast, col ='red')
##D 
##D ## Plot convex hull in interactive tetrahedron
##D tcsplot(tcs.sicalis, col = 'blue', size = 0.005)
##D tcsvol(tcs.sicalis)
## End(Not run)




