library(packcircles)


### Name: circleLayoutVertices
### Title: Generate a set of circle vertices suitable for plotting
### Aliases: circleLayoutVertices

### ** Examples

xmax <- 100
ymax <- 100
rmin <- 10
rmax <- 20
N <- 20

## Random centre coordinates and radii
layout <- data.frame(id = 1:N,
                     x = runif(N, 0, xmax), 
                     y = runif(N, 0, ymax), 
                     radius = runif(N, rmin, rmax))

## Get data for circle vertices
verts <- circleLayoutVertices(layout, idcol=1, xysizecols=2:4,
                              sizetype = "radius")

## Not run: 
##D library(ggplot2)
##D 
##D ## Draw circles annotated with their IDs
##D ggplot() + 
##D   geom_polygon(data = verts, aes(x, y, group = id), 
##D                fill = "grey90", 
##D                colour = "black") +
##D                
##D   geom_text(data = layout, aes(x, y, label = id)) + 
##D   
##D   coord_equal() +
##D   theme_bw()
## End(Not run)




