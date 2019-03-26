library(hint)


### Name: Binomialintersection
### Title: The Binomial Intersection Distribution
### Aliases: Binomialintersection dbint pbint qbint rbint
### Keywords: distribution univar

### ** Examples

## Generate the distribution of intersections sizes:
dd <- dbint(20, c(10, 12, 11, 14))
## Restrict the range of intersections.
dd <- dbint(20, c(10, 12), range = 0:5)
## Generate cumulative probabilities.
pp <- pbint(29, c(15, 8), vals = 5)
pp <- pbint(29, c(15, 8), vals = 2, upper.tail = FALSE)
## Extract quantiles:
qq <- qbint(0.15, 23, c(12, 10))
## Generate random samples from Binomial intersection distributions.
rr <- rbint(num = 10, 18, c(9, 14))



