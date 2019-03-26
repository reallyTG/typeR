library(soundgen)


### Name: getRough
### Title: Get roughness
### Aliases: getRough
### Keywords: internal

### ** Examples

m = matrix(rnorm(100, 10, 1), nrow = 10)
rownames(m) = seq(-10, 10, length.out = nrow(m))
soundgen:::getRough(m, roughRange = c(6, 8))



