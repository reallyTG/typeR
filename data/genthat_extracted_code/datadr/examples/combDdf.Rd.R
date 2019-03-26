library(datadr)


### Name: combDdf
### Title: "DDF" Recombination
### Aliases: combDdf

### ** Examples

# Divide the iris data
bySpecies <- divide(iris, by = "Species")

## Simple combination to form a ddf
##---------------------------------------------------------

# Add a transform that selects the petal width and length variables
selVars <- function(x) x[,c("Petal.Width", "Petal.Length")]

# Apply the transform and combine using combDdo
combined <- recombine(addTransform(bySpecies, selVars), combine = combDdf)
combined
combined[[1]]

# A more concise (and readable) way to do it
bySpecies %>%
  addTransform(selVars) %>%
  recombine(combDdf)

## Combination that involves rbinding to give the ddf
##---------------------------------------------------------

# A transformation that returns a list
listTrans <- function(x) {
  list(meanPetalWidth = mean(x$Petal.Width),
       maxPetalLength = max(x$Petal.Length))
}

# Apply the transformation and look at the result
bySpeciesTran <- addTransform(bySpecies, listTrans)
bySpeciesTran[[1]]

# And if we rbind the "value" of the first subset:
out1 <- rbind(bySpeciesTran[[1]]$value)
out1

# Note how the combDdf method row binds the two data frames
combined <- recombine(bySpeciesTran, combine = combDdf)
out2 <- combined[[1]]
out2

# These are equivalent
identical(out1, out2$value)




