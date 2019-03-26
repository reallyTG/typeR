library(sensR)


### Name: findcr
### Title: Find the critical value of a one-tailed binomial test
### Aliases: findcr
### Keywords: models

### ** Examples

## Find the critical value for a triangle test for the level 0.05 test
## with 25 subjects:
findcr(sample.size = 25, , p0 = 1/3)

## Similarity example:
findcr(sample.size = 25, p0 = 1/3, pd0 = .2, test = "simil")



