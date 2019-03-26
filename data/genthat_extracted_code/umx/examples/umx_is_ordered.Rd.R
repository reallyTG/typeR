library(umx)


### Name: umx_is_ordered
### Title: Test if one or more variables in a dataframe are ordered
### Aliases: umx_is_ordered

### ** Examples

tmp = mtcars
tmp$cyl = ordered(mtcars$cyl) # ordered factor
tmp$vs = ordered(mtcars$vs) # binary factor
umx_is_ordered(tmp) # numeric indices
umx_is_ordered(tmp, names = TRUE)
umx_is_ordered(tmp, names = TRUE, binary.only = TRUE)
umx_is_ordered(tmp, names = TRUE, ordinal.only = TRUE)
umx_is_ordered(tmp, names = TRUE, continuous.only = TRUE)
umx_is_ordered(tmp, continuous.only = TRUE)
isContinuous = !umx_is_ordered(tmp)
tmp$gear = factor(mtcars$gear) # unordered factor
# nb: Factors are not necessarily ordered! By default unordered factors cause an message...
## Not run: 
##D tmp$cyl = factor(mtcars$cyl)
##D umx_is_ordered(tmp, names=TRUE)
## End(Not run)



