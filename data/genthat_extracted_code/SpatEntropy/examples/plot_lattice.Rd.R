library(SpatEntropy)


### Name: plot_lattice
### Title: Plot lattice data.
### Aliases: plot_lattice

### ** Examples

data.lat=matrix(sample(c("a","b","c"), 100, replace=TRUE), nrow=10)
plot_lattice(data.lat)

plot_lattice(data.lat, win=square(100))

plot_lattice(data.lat, win=square(10), gray.ext=c(1,.4), ribbon=FALSE)




