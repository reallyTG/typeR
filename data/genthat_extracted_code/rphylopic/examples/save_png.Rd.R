library(rphylopic)


### Name: save_png
### Title: Save an image to disk as a '.png' file
### Aliases: save_png

### ** Examples

## Not run: 
##D # get a silhouette
##D cat <- image_data("23cd6aa4-9587-4a2e-8e26-de42885004c9", size = 128)[[1]]
##D 
##D # save image
##D out <- save_png(cat)
##D identical(png::readPNG(out), cat)
##D 
##D save_png(cat, dpi = 1000)
## End(Not run)



