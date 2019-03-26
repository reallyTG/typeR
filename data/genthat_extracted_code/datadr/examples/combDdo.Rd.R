library(datadr)


### Name: combDdo
### Title: "DDO" Recombination
### Aliases: combDdo

### ** Examples

# Divide the iris data
bySpecies <- divide(iris, by = "Species")

# Add a transform that returns a list for each subset
listTrans <- function(x) {
  list(meanPetalWidth = mean(x$Petal.Width),
       maxPetalLength = max(x$Petal.Length))
}

# Apply the transform and combine using combDdo
combined <- recombine(addTransform(bySpecies, listTrans), combine = combDdo)
combined
combined[[1]]

# A more concise (and readable) way to do it
bySpecies %>%
  addTransform(listTrans) %>%
  recombine(combDdo)



