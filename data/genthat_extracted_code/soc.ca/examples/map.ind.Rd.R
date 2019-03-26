library(soc.ca)


### Name: map.ind
### Title: Map the individuals of a soc.ca analysis
### Aliases: map.ind

### ** Examples

example(soc.ca)
map.ind(result)
map.ind(result, map.title = "Each individual is given its shape according to a value in a factor",
 point.shape = active[, 1], legend = TRUE)
map  <- map.ind(result, map.title = "The contribution of the individuals with new scale",
 point.color = result$ctr.ind[, 1], point.shape = 18) 
map + scale_color_continuous(low = "white", high = "red")
quad   <- create.quadrant(result)
map.ind(result, map.title = "Individuals in the space given shape and color by their quadrant",
 point.shape = quad, point.color = quad)



