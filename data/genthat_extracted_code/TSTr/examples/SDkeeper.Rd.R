library(TSTr)


### Name: SDkeeper
### Title: Pre-creates a data.table or a ternary search tree
### Aliases: SDkeeper

### ** Examples

fruitTree <- SDkeeper(c("apple", "orange", "lemon"), 2)
fruitTree <- SDkeeper(c("apple", "orange", "lemon"), 1, useTST = TRUE)
SDcheck(fruitTree,"aple")



