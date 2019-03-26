library(lenses)


### Name: take_l
### Title: Construct a lens into a prefix of a vector
### Aliases: take_l

### ** Examples

x <- 1:10
view(x, take_l(3))
view(x, take_l(-7))
set(x, take_l(2), c(100,200))
set(x, take_l(-8), c(100,200))



