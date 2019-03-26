library(soc.ca)


### Name: map.add
### Title: Add points to an existing map created by one of the soc.ca
###   mapping functions.
### Aliases: map.add

### ** Examples

example(soc.ca)
original.map    <- map.sup(result)
map.add(result, original.map, plot.type = "ctr", ctr.dim = 2)
map.add(result, map.ind(result), plot.type = "select",list.ind = 1:50,
 point.color = "red", label = FALSE, point.size = result$ctr.ind[1:50, 1]*2000)



