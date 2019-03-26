library(lenses)


### Name: t_l
### Title: Matrix transpose lens
### Aliases: t_l
### Keywords: datasets

### ** Examples

(x <- matrix(1:4, ncol = 2))
view(x, t_l)
set(x, t_l, matrix(11:14, ncol = 2))



