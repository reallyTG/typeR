library(prevR)


### Name: create.boundary
### Title: Provide national boundaries of a country.
### Aliases: create.boundary
### Keywords: manip spatial

### ** Examples

## Not run: 
##D boundary <- create.boundary()
## End(Not run)
## Don't show: 
par(ask = TRUE)
## End(Don't show)
boundary <- create.boundary("Burkina Faso")
boundary <- create.boundary("Burkina Faso",
 proj="+proj=utm +zone=30 +ellps=WGS84 +datum=WGS84 +units=m +no_defs")
boundary <- create.boundary(countries = c("Burkina Faso", "Ghana", "Benin"))
## Don't show: 
par(ask = FALSE)
## End(Don't show)




