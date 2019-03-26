library(pavo)


### Name: plot.rimg
### Title: Plot unprocessed or colour-classified images
### Aliases: plot.rimg

### ** Examples

## Not run: 
##D papilio <- getimg(system.file("testdata/images/papilio.png", package = 'pavo'))
##D plot(papilio)
##D papilio_class <- classify(papilio, kcols = 4)
##D plot(papilio_class)
##D 
##D # Multiple images
##D snakes <- getimg(system.file("testdata/images/snakes", package = 'pavo'))
##D plot(snakes)
##D snakes_class <- classify(snakes, kcols = 3)
##D plot(snakes_class)
## End(Not run)




