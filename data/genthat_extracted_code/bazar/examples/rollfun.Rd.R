library(bazar)


### Name: rollfun
### Title: Moving windows with custom function
### Aliases: rollfun make_idx

### ** Examples

set.seed(1)
x <- sample(1:10)
rollfun(x, k = 3)
rollfun(x, k = 3, fun = max)




