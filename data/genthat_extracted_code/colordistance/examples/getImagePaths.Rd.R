library(colordistance)


### Name: getImagePaths
### Title: Fetch paths to all valid images in a given directory
### Aliases: getImagePaths

### ** Examples

im.dir <- colordistance::getImagePaths(system.file("extdata",
"Heliconius/Heliconius_A", package="colordistance"))
## Not run: 
##D im.dir <- colordistance::getImagePaths("some/nonexistent/directory")
## End(Not run)
im.dir <- colordistance::getImagePaths(getwd())




