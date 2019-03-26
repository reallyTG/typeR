library(lenses)


### Name: dim_l
### Title: Dims lens
### Aliases: dim_l
### Keywords: datasets

### ** Examples

x <- 1:10

(y <- set(x, dim_l, c(2,5)))
view(y, dim_l)



