library(soc.ca)


### Name: map.density
### Title: Density plot for the cloud of individuals
### Aliases: map.density

### ** Examples

example(soc.ca)
map.density(result, map.ind(result, dim = 2:3, point.alpha = 0.2))
map.density(result, map.ind(result, legend = TRUE, point.alpha = 0.2),
 group = duplicated(active), color = duplicated(active),
 linetype = duplicated(active))
map.density(result, map.ctr(result))



