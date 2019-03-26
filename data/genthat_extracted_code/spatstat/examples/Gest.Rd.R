library(spatstat)


### Name: Gest
### Title: Nearest Neighbour Distance Function G
### Aliases: Gest nearest.neighbour
### Keywords: spatial nonparametric

### ** Examples

  data(cells)
  G <- Gest(cells)
  plot(G)

  # P-P style plot
  plot(G, cbind(km,theo) ~ theo)

  # the empirical G is below the Poisson G,
  # indicating an inhibited pattern

  ## Not run: 
##D      plot(G, . ~ r)
##D      plot(G, . ~ theo)
##D      plot(G, asin(sqrt(.)) ~ asin(sqrt(theo)))
##D   
## End(Not run)



