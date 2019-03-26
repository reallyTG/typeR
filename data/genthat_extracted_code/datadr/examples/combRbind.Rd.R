library(datadr)


### Name: combRbind
### Title: "rbind" Recombination
### Aliases: combRbind

### ** Examples

# Create a distributed data frame using the iris data set
bySpecies <- divide(iris, by = "Species")

# Create a function that will calculate the standard deviation of each
# variable in in a subset. The calls to 'as.data.frame()' and 't()'
# convert the vector output of 'apply()' into a data.frame with a single row
sdCol <- function(x) as.data.frame(t(apply(x, 2, sd)))

# Combine the results using rbind
combined <- recombine(addTransform(bySpecies, sdCol), combine = combRbind)
class(combined)
combined

# A more concise (and readable) way to do it
bySpecies %>%
  addTransform(sdCol) %>%
  recombine(combRbind)




