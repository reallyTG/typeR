library(matsbyname)


### Name: naryapply_byname
### Title: Apply a function "by name" to any number of operands
### Aliases: naryapply_byname

### ** Examples

naryapply_byname(FUN = sum_byname, 2, 3)
naryapply_byname(FUN = sum_byname, 2, 3, 4, -4, -3, -2)
# Routes to unaryapply_byname
naryapply_byname(FUN = `^`, list(1,2,3), .FUNdots = 2)



