library(bnclassify)


### Name: grain_and_graph
### Title: Convert to graph and gRain.
### Aliases: grain_and_graph as_graphNEL as_grain

### ** Examples

data(car)
nb <- bnc('nb', 'class', car, smooth = 1)
# Requires the grain and graph packages installed
## Not run: g <- as_grain(nb)
## Not run: gRain::querygrain.grain(g)$buying



