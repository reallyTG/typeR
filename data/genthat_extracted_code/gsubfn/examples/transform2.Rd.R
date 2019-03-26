library(gsubfn)


### Name: transform2
### Title: Like transform but allows right hand sides to refer to left hand
###   sides.
### Aliases: transform2
### Keywords: misc

### ** Examples

## Not run: 
##D # bad
##D transform(BOD, b = a, a = demand)
## End(Not run)
# OK.  a is set to demand and b is set to a so both wind up equal to demand
transform2(BOD, b = a, a = demand)



