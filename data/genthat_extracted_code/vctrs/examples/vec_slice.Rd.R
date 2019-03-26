library(vctrs)


### Name: vec_slice
### Title: Get or set observations in a vector
### Aliases: vec_slice vec_slice<-
### Keywords: internal

### ** Examples

x <- sample(10)
x
vec_slice(x, 1:3)
vec_slice(x, 2L) <- 100
x

vec_slice(mtcars, 1:3)



