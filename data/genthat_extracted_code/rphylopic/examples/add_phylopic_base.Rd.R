library(rphylopic)


### Name: add_phylopic_base
### Title: Input an image and add to an existing plot made with base
###   graphics
### Aliases: add_phylopic_base plot_phylopic_base

### ** Examples

## Not run: 
##D # get a silhouette
##D cat <- image_data("23cd6aa4-9587-4a2e-8e26-de42885004c9", size = 128)[[1]]
##D 
##D # single image
##D plot(1, 1, type="n", main="A cat herd")
##D add_phylopic_base(cat, 0.5, 0.5, 0.2)
##D 
##D # lots of images
##D posx <- runif(50, 0, 1)
##D posy <- runif(50, 0, 1)
##D size <- runif(50, 0.01, 0.2)
##D plot(posx, posy, type="n", main="A cat herd")
##D for (i in 1:50) {
##D   add_phylopic_base(cat, posx[i], posy[i], size[i])
##D }
##D 
##D # plot a stand alone image of the silhouette
##D plot_phylopic_base(cat)
## End(Not run)



