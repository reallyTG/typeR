library(PCovR)


### Name: tarrotob
### Title: Oblique target rotation
### Aliases: tarrotob
### Keywords: rotation

### ** Examples

Px <- matrix(rnorm(36),12,3)
print(Px)

W <- matrix(rbinom(36,1,.4),12,3)
Px_r <- tarrotob(Px,W)
print(Px_r$A)



