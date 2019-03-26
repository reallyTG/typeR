library(SOMbrero)


### Name: plot.myGrid
### Title: Draw a 'myGrid' class object
### Aliases: plot.myGrid
### Keywords: aplot

### ** Examples

# creating grid
a.grid <- initGrid(dimension=c(5,5), topo="square", dist.type="maximum")

# plotting grid
# without any color specification
plot(a.grid)
# generating colors from rainbow() function
my.colors <- rainbow(5*5)
plot(a.grid, neuron.col=my.colors)



