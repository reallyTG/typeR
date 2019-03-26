library(pavo)


### Name: coldist
### Title: Color distances
### Aliases: coldist

### ** Examples

## Not run: 
##D # Dichromat
##D data(flowers)
##D vis.flowers <- vismodel(flowers, visual = 'canis', relative = FALSE)
##D didist.flowers <- coldist(vis.flowers)
##D 
##D # Trichromat
##D vis.flowers <- vismodel(flowers, visual = 'apis', relative = FALSE)
##D tridist.flowers <- coldist(vis.flowers)
##D 
##D # Trichromat, color-hexagon model (euclidean distances)
##D vis.flowers <- vismodel(flowers, visual = 'apis', qcatch = 'Ei',
##D                         relative = FALSE, vonkries = TRUE, achro = 'l', bkg = 'green')
##D hex.flowers <- colspace(vis.flowers, space = 'hexagon')
##D hexdist.flowers <- coldist(hex.flowers)
##D 
##D # Trichromat, color-opponent-coding model (manhattan distances)
##D vis.flowers <- vismodel(flowers, visual = 'apis', qcatch = 'Ei', relative = FALSE, vonkries = TRUE)
##D coc.flowers <- colspace(vis.flowers, space = 'coc')
##D hexdist.flowers <- coldist(coc.flowers)
##D 
##D # Tetrachromat
##D data(sicalis)
##D vis.sicalis <- vismodel(sicalis, visual = 'avg.uv', relative = FALSE)
##D tetradist.sicalis.n <- coldist(vis.sicalis)
##D 
##D # This will also work, but give you several warnings you shouldn't ignore!!
##D col.sicalis <- colspace(vis.sicalis)
##D tetradist.sicalis.n <- coldist(col.sicalis)
##D 
##D tetradist.sicalis.q <- coldist(vis.sicalis, noise = 'quantum')
## End(Not run)




