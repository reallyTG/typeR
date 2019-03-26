library(PCovR)


### Name: wvarim
### Title: Weighted varimax
### Aliases: wvarim
### Keywords: rotation

### ** Examples

Px <- matrix(rnorm(36),12,3)
print(Px)

Px_r <- wvarim(Px)
print(Px_r$loadings)



