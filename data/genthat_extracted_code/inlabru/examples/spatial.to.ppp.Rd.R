library(inlabru)


### Name: spatial.to.ppp
### Title: Convert SpatialPoints and boundary polygon to spatstat ppp
###   object
### Aliases: spatial.to.ppp

### ** Examples


## No test: 
# Load Gorilla data

data("gorillas", package = "inlabru")

# Use nest locations and survey boundary to create a spatstat ppp object

gp <- spatial.to.ppp(gorillas$nests, gorillas$boundary)
class(gp)

# Plot it

plot(gp)
## End(No test)



