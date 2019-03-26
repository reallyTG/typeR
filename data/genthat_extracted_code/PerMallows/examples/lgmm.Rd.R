library(PerMallows)


### Name: lgmm
### Title: Learn a Generalized Mallows Model
### Aliases: lgmm

### ** Examples

data <- matrix(c(1,2,3,4, 1,4,3,2, 1,2,4,3), nrow = 3, ncol = 4, byrow = TRUE)
lgmm(data, dist.name="kendall", estimation="approx")
lgmm(data, dist.name="cayley", estimation="approx")
lgmm(data, dist.name="cayley", estimation="exact")
lgmm(data, dist.name="hamming", estimation="approx")



