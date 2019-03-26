library(GPfit)


### Name: scale_norm
### Title: Scale variable into normal range 0, 1
### Aliases: scale_norm

### ** Examples

scale_norm(x = c(-1, 4, 10, 182))
# lower bound extended beyond -1
# upper bound still range of data
scale_norm(x = c(-1, 4, 10, 182), range = c(-100, 100))



