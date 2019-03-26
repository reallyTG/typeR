library(datadr)


### Name: drLapply
### Title: Apply a function to all key-value pairs of a ddo/ddf object
### Aliases: drLapply

### ** Examples

bySpecies <- divide(iris, by = "Species")
drLapply(bySpecies, function(x) x$Sepal.Width)



