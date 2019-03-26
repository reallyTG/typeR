library(x3ptools)


### Name: transpose_x3p
### Title: Transpose an x3p object
### Aliases: transpose_x3p

### ** Examples

logo <- read_x3p(system.file("csafe-logo.x3p", package="x3ptools"))
dim(logo$surface.matrix)
## Not run: 
##D image_x3p(logo)
## End(Not run)
#  transpose the image
logotp <- transpose_x3p(logo)
dim(logotp$surface.matrix)
## Not run: 
##D image_x3p(logotp)
## End(Not run)



