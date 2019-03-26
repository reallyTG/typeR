library(rcdk)


### Name: view.molecule.2d
### Title: View and Copy 2D Structure Diagrams
### Aliases: get.depictor view.molecule.2d view.image.2d
###   copy.image.to.clipboard depict
### Keywords: programming

### ** Examples

m <- parse.smiles('c1ccccc1C(=O)NC')[[1]]

## Not run: 
##D dep <- get.depictor(width=200, height=200)
##D img <- view.image.2d(m, dep)
##D plot(1:10, 1:10, pch=19)
##D rasterImage(img, 0,8, 2,10)
##D 
##D dep$setHeight(as.integer(400))
##D dep$setWidth(as.integer(400))
##D copy.image.to.clipboard(m,d) ## Paste into Word
##D 
## End(Not run)



