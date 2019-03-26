library(x3ptools)


### Name: y_flip_x3p
### Title: Flip the y coordinate of an x3p image
### Aliases: y_flip_x3p

### ** Examples

logo <- read_x3p(system.file("csafe-logo.x3p", package="x3ptools"))
dim(logo$surface.matrix)
## Not run: 
##D image_x3p(logo)
## End(Not run)
# flip the y-axis for the old ISO standard:
logoflip <- y_flip_x3p(logo)
dim(logoflip$surface.matrix)
## Not run: 
##D image_x3p(logoflip)
## End(Not run)



