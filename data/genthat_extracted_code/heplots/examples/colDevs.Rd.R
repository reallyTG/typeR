library(heplots)


### Name: colDevs
### Title: Calculate column deviations from central values
### Aliases: colDevs
### Keywords: manip

### ** Examples

data(iris)

Species <- iris$Species
irisdev <- colDevs(iris[,1:4], Species, mean)
irisdev <- colDevs(iris[,1:4], Species, median)
# trimmed mean, using an anonymous function
irisdev <- colDevs(iris[,1:4], Species, function(x) mean(x, trim=0.25))

# no grouping variable: deviations from column grand means
# include all variables (but suppress warning for this doc)
irisdev <- suppressWarnings( colDevs(iris) )



