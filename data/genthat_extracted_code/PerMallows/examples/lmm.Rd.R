library(PerMallows)


### Name: lmm
### Title: Learn a Mallows Model
### Aliases: lmm

### ** Examples

data <- matrix(c(1,2,3,4, 1,4,3,2, 1,2,4,3), nrow = 3, ncol = 4, byrow = TRUE)
lmm(data, dist.name="kendall", estimation="approx")
lmm(data, dist.name="cayley", estimation="approx")
lmm(data, dist.name="cayley", estimation="exact")
lmm(data, dist.name="hamming", estimation="exact")
lmm(data, dist.name="ulam", estimation="approx")



