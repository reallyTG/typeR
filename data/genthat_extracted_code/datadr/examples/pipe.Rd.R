library(datadr)


### Name: %>%
### Title: Pipe data
### Aliases: %>%

### ** Examples

# Suppose we wish to do the following:
bySpecies <- divide(iris, by = "Species")
bySpeciesTransformed <- addTransform(bySpecies, function(x) mean(x$Sepal.Length))
recombine(bySpeciesTransformed, combine = combRbind)

# We can do it more consely using the pipe: '%>%'
divide(iris, by = "Species") %>%
  addTransform(function(x) mean(x$Sepal.Length)) %>%
    recombine(combRbind)



