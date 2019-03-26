library(spatstat)


### Name: fourierbasis
### Title: Fourier Basis Functions
### Aliases: fourierbasis fourierbasisraw

### ** Examples

## 27 rows of three dimensional Fourier frequencies:
k <- expand.grid(-1:1,-1:1, -1:1)
## Two random points in the three dimensional unit box:
x <- rbind(runif(3),runif(3))
## 27 by 2 resulting matrix:
v <- fourierbasis(x, k)
head(v)



