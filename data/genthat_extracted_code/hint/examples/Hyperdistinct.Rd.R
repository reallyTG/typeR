library(hint)


### Name: Hyperdistinct
### Title: Drawing Distinct Categories from a Single Urn
### Aliases: Hyperdistinct dhydist phydist qhydist rhydist
### Keywords: distribution univar

### ** Examples

## Generate the distribution of distinct categories drawn from a single urn.
dd <- dhydist(20, 10, 12)
## Restrict the range of intersections.
dd <- dhydist(20, 10, 12, range = 5:10)
## Generate cumulative probabilities.
pp <- phydist(29, 15, 8, vals = 5)
pp <- phydist(29, 15, 8, vals = 2, upper.tail = FALSE)
## Extract quantiles:
qq <- qhydist(0.15, 23, 12, 10)
## Generate random samples based on this distribution.
rr <- rhydist(num = 10, 18, 9, 12)



