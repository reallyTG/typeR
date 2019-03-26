library(madness)


### Name: vec
### Title: vectorize a multidimensional array.
### Aliases: vec vec vec,madness-method vec,array-method vech
###   vech,array-method vech,madness-method ivech ivech,ANY-method
###   ivech,madness-method

### ** Examples

y <- matrix(rnorm(16),ncol=4)
sy <- y + t(y)
vy <- vec(sy)
vmy <- vec(madness(sy))
vhy <- vech(sy)
vmhy <- vech(madness(sy))

ivech(c(1,2,3))
ivech(c(1,2,3),-1)
ivech(c(1,2,3),-1,symmetric=TRUE)
ivech(c(1,2,3,4,5,6,7,8),1)



