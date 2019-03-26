library(ompr)


### Name: [,LinearVariableCollection,ANY,ANY,missing-method
### Title: Subset model variables
### Aliases: [,LinearVariableCollection,ANY,ANY,missing-method

### ** Examples

## Not run: 
##D   # vectors create matrix rows
##D   # x[1, 1]
##D   # x[2, 1]
##D   # x[3, 1]
##D   x[1:3, 1]
##D 
##D   # colwise() creates columns per row
##D   # 1 * x[1, 1] + 2 * x[1, 2] + 3 * x[1, 3]
##D   colwise(1, 2, 3) * x[1, colwise(1, 2, 3)]
##D 
##D   # you can also combine the two
##D   # x[1, 1]
##D   # x[2, 1] + x[2, 2]
##D   # x[3, 1] + x[3, 2] + x[3, 2]
##D   x[1:3, colwise(1, 1:2, 1:3)]
## End(Not run)



