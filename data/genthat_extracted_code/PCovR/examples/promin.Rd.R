library(PCovR)


### Name: promin
### Title: Promin rotation
### Aliases: promin
### Keywords: rotation

### ** Examples

Px <- matrix(rnorm(36),12,3)
print(Px)

Px_r <- promin(Px)
print(Px_r$loadings)



