library(ape)


### Name: mvr
### Title: Minimum Variance Reduction
### Aliases: mvr mvrs
### Keywords: models

### ** Examples

data(woodmouse)
rt <- dist.dna(woodmouse, variance = TRUE)
v <- attr(rt, "variance")
tr <- mvr(rt, v)
plot(tr, "u")



