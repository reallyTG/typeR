library(pavo)


### Name: summary.colspace
### Title: Colorspace data summary
### Aliases: summary.colspace

### ** Examples

## Not run: 
##D # Colour hexagon
##D data(flowers)
##D vis.flowers <- vismodel(flowers, visual = 'apis', qcatch = 'Ei', relative = FALSE,
##D                         vonkries = TRUE, bkg = 'green')
##D flowers.hex <- hexagon(vis.flowers)
##D summary(flowers.hex)
##D 
##D # Tetrahedral model
##D data(sicalis)
##D vis.sicalis <- vismodel(sicalis, visual='avg.uv')
##D csp.sicalis <- colspace(vis.sicalis)
##D summary(csp.sicalis, by = rep(c('C', 'T', 'B'), 7))
## End(Not run)




