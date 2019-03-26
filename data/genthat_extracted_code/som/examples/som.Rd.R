library(som)


### Name: som
### Title: Function to train a Self-Organizing Map
### Aliases: som.init som som.train som.update som.project
### Keywords: cluster

### ** Examples

data(yeast)
yeast <- yeast[, -c(1, 11)]
yeast.f <- filtering(yeast)
yeast.f.n <- normalize(yeast.f)
foo <- som(yeast.f.n, xdim=5, ydim=6)
foo <- som(yeast.f.n, xdim=5, ydim=6, topol="hexa", neigh="gaussian")
plot(foo)



