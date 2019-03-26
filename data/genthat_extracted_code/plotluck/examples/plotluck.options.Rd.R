library(plotluck)


### Name: plotluck.options
### Title: Create options structure for 'plotluck'
### Aliases: plotluck.options

### ** Examples

# list all default options
plotluck.options()

data(iris)
# default with violin plot
plotluck(iris, Petal.Length~Species)

# use box-and-whiskers plot instead
plotluck(iris, Petal.Length~Species, opts=plotluck.options(geom='box'))




