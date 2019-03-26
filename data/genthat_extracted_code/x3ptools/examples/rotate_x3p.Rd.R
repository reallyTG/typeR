library(x3ptools)


### Name: rotate_x3p
### Title: Rotate an x3p object
### Aliases: rotate_x3p

### ** Examples

logo <- read_x3p(system.file("csafe-logo.x3p", package="x3ptools"))
dim(logo$surface.matrix)
## Not run: 
##D image_x3p(logo)
## End(Not run)
# rotate the image by 90 degrees clock-wise:
logo90 <- rotate_x3p(logo, 90)
dim(logo90$surface.matrix)
## Not run: 
##D image_x3p(logo90)
## End(Not run)



