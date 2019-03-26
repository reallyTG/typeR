library(pavo)


### Name: summary.rimg
### Title: Image summary
### Aliases: summary.rimg

### ** Examples

## Not run: 
##D papilio <- getimg(system.file("testdata/images/papilio.png", package = 'pavo'))
##D papilio_class <- classify(papilio, kcols = 4)
##D summary(papilio_class)
##D 
##D # Plot the colour-classified image alongside the colour class palette
##D summary(papilio_class, plot = TRUE)
##D 
##D # Multiple images
##D snakes <- getimg(system.file("testdata/images/snakes", package = 'pavo'))
##D snakes_class <- classify(snakes, kcols = 3)
##D summary(snakes_class, plot = TRUE)
## End(Not run)




