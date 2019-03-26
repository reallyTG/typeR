library(SoDA)


### Name: scanRepeated
### Title: Read data with multiple line patterns
### Aliases: scanRepeated
### Keywords: data

### ** Examples

## Not run: 
##D  what = list(
##D     list(abb = "", population = 1, area = 1, 
##D          latitude = 1, longitude = 1),
##D     list(name = "", population = 1, area = 1)
##D )
##D data <- scanRepeated("stateCities.txt", what, sep = ",")
## End(Not run)
## produces a list of 100 elements, alternately state and city data.



