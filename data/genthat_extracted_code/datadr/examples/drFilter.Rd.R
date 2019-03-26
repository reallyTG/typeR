library(datadr)


### Name: drFilter
### Title: Filter a 'ddo' or 'ddf' Object
### Aliases: drFilter

### ** Examples

# Create a ddf using the iris data
bySpecies <- divide(iris, by = "Species")

# Filter using only the 'value' of the key/value pair
drFilter(bySpecies, function(v) mean(v$Sepal.Width) < 3)

# Filter using both the key and value
drFilter(bySpecies, function(k,v) k != "Species=virginica" & mean(v$Sepal.Width) < 3)



