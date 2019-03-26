library(sfsmisc)


### Name: xy.unique.x
### Title: Uniqify (X,Y) Values using Weights
### Aliases: xy.unique.x
### Keywords: utilities

### ** Examples

## simple example:
x <- c(1,1,2,4,3,1)
y <- 1:6
rbind(x, y)
xy.unique.x(x, y)
#   x y w
# 1 1 3 3
# 2 2 3 1
# 3 4 4 1
# 4 3 5 1
xy.unique.x(x, y, fromLast = TRUE)



