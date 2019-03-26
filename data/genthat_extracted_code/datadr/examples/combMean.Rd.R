library(datadr)


### Name: combMean
### Title: Mean Recombination
### Aliases: combMean

### ** Examples

# Create a distributed data frame using the iris data set
bySpecies <- divide(iris, by = "Species")

# Add a transformation that returns a vector of sums for each subset, one
# mean for each variable
bySpeciesTrans <- addTransform(bySpecies, function(x) apply(x, 2, sum))
bySpeciesTrans[[1]]

# Calculate the elementwise mean of the vector of sums produced by
# the transform, across the keys
out1 <- recombine(bySpeciesTrans, combine = combMean)
out1

# A more concise (and readable) way to do it
bySpecies %>%
  addTransform(function(x) apply(x, 2, sum)) %>%
  recombine(combMean)

# This manual, non-datadr approach illustrates the above computation

# This step mimics the transformation above
sums <- aggregate(. ~ Species, data = iris, sum)
sums

# And this step mimics the mean recombination
out2 <- apply(sums[,-1], 2, mean)
out2

# These are the same
identical(out1, out2)




