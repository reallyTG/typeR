library(inlabru)


### Name: gm
### Title: ggplot geom for spatial data
### Aliases: gm

### ** Examples

## No test: 
# Load the Gorilla data
data(gorillas, package = "inlabru")
 
# Create a base map centered around the nests and plot the boundary as well as the nests
gmap(gorillas$nests, maptype = "satellite") + 
    gm(gorillas$boundary) + 
    gm(gorillas$nests, color = "white", size = 0.5)
 
## End(No test)



