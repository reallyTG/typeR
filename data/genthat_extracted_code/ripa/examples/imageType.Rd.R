library(ripa)


### Name: imageType
### Title: Get information on color type of imagematrix
### Aliases: imageType
### Keywords: misc

### ** Examples

## Not run: 
##D   x <- read.jpeg(system.file("extdata", "Rlogo.jpg", package="ripa"))
##D   cat("Image Type", imageType(x))
##D 
##D   x.grey <- rgb2grey(x)
##D   cat("Image Type", imageType(x.grey))
## End(Not run)



