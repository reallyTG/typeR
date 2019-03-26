library(imager)


### Name: squeeze
### Title: Remove empty dimensions from an array
### Aliases: squeeze

### ** Examples

A <- array(1:9,c(3,1,3)) #3D array with one flat dimension
A %>% squeeze #flat dimension removed



