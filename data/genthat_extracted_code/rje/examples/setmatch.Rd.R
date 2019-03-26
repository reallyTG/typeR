library(rje)


### Name: setmatch
### Title: Set Operations
### Aliases: setmatch subsetmatch setsetdiff setsetequal
### Keywords: arith

### ** Examples

x = list(1:2, 1:3)
y = list(1:4, 1:3)
setmatch(x, y)
subsetmatch(x, y)
setsetdiff(x, y)

x = list(1:3, 1:2)
y = list(2:1, c(2,1,3))
setsetequal(x, y)



