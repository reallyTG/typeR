library(pavo)


### Name: classify
### Title: Identify colour classes in an image for adjacency analyses
### Aliases: classify

### ** Examples

## Not run: 
##D # Single image
##D papilio <- getimg(system.file("testdata/images/papilio.png", package = 'pavo'))
##D papilio_class <- classify(papilio, kcols = 4)
##D 
##D # Multiple images, with interactive classification and a reference image
##D snakes <- getimg(system.file("testdata/images/snakes", package = 'pavo'))
##D snakes_class <- classify(snakes, refID = 1, interactive = TRUE)
## End(Not run)




