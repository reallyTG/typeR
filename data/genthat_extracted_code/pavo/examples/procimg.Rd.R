library(pavo)


### Name: procimg
### Title: Process images
### Aliases: procimg

### ** Examples

## Not run: 
##D # Single image
##D papilio <- getimg(system.file("testdata/images/papilio.png", package = 'pavo'))
##D papilio <- procimg(papilio, scaledist = 10)
##D 
##D # Assign individual scales to each image, after slightly reducing their size.
##D snakes <- getimg(system.file("testdata/images/snakes", package = 'pavo'))
##D snakes <- procimg(snakes, scaledist = c(10, 14), resize = 0.95)
## End(Not run)




