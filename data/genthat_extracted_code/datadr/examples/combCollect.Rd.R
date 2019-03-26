library(datadr)


### Name: combCollect
### Title: "Collect" Recombination
### Aliases: combCollect

### ** Examples

# Create a distributed data frame using the iris data set
bySpecies <- divide(iris, by = "Species")

# Function to calculate the mean of the petal widths
meanPetal <- function(x) mean(x$Petal.Width)

# Combine the results using rbind
combined <- recombine(addTransform(bySpecies, meanPetal), combine = combCollect)
class(combined)
combined

# A more concise (and readable) way to do it
bySpecies %>%
  addTransform(meanPetal) %>%
  recombine(combCollect)



