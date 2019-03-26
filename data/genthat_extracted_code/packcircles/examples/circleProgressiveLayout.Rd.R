library(packcircles)


### Name: circleProgressiveLayout
### Title: Progressive layout algorithm
### Aliases: circleProgressiveLayout

### ** Examples

areas <- sample(c(4, 16, 64), 100, rep = TRUE, prob = c(60, 30, 10))
packing <- circleProgressiveLayout(areas)

## Not run: 
##D 
##D # Graph the result with ggplot
##D dat.gg <- circleLayoutVertices(packing)
##D 
##D ggplot(data = dat.gg, aes(x, y, group = id)) +
##D   geom_polygon(colour = "black", fill = "grey90") +
##D   coord_equal() +
##D   theme_void()
##D 
## End(Not run)




