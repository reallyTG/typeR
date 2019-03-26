library(x3ptools)


### Name: sample_x3p
### Title: Sample from an x3p object
### Aliases: sample_x3p

### ** Examples

logo <- read_x3p(system.file("csafe-logo.x3p", package="x3ptools"))
dim(logo$surface.matrix)
# down-sample to one-fourth of the image:
logo4 <- sample_x3p(logo, m=4)
dim(logo4$surface.matrix)
## Not run: 
##D image_x3p(logo)
##D image_x3p(logo4)
## End(Not run)



