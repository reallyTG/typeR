library(philentropy)


### Name: estimate.probability
### Title: Estimate Probability Vectors From Count Vectors
### Aliases: estimate.probability

### ** Examples


# generate a count vector
x <- runif(100)

# generate a probability vector from corresponding counts
# method = "empirical"
x.prob <- estimate.probability(x, method = "empirical")




