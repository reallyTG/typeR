library(hint)


### Name: Hyperintersection
### Title: The Hypergeometric Intersection Family of Distributions
### Aliases: Hyperintersection dhint phint qhint rhint
### Keywords: distribution univar

### ** Examples

## Generate the distribution of intersections sizes without duplicates:
dd <- dhint(20, c(10, 12))
## Restrict the range of intersections.
dd <- dhint(20, c(10, 12), range = 0:5)
## Allow duplicates in q of the categories in the second urn:
dd <- dhint(35, c(15, 11), 22, verbose = FALSE)
## Generate cumulative probabilities.
pp <- phint(29, c(15, 8), vals = 5)
pp <- phint(29, c(15, 8), vals = 2, upper.tail = FALSE)
pp <- phint(29, c(15, 8), 23, vals = 2)
## Extract quantiles:
qq <- qhint(0.15, 23, c(12, 10))
qq <- qhint(0.15, 23, c(12, 10), 18)
## Generate random samples from Hypergeometric intersection distributions.
rr <- rhint(num = 10, 18, c(9, 14))
rr <- rhint(num = 10, 22, c(11, 17), 12)



