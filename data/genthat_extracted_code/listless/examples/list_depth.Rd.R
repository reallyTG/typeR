library(listless)


### Name: list_depth
### Title: Get the depth of a list
### Aliases: list_depth

### ** Examples

list_depth(list(1))
list_depth(list(1, list(2:3, 4:6)))

# Atomic variables have depth 0
list_depth(1)

# Empty elements can be pruned before counting
list_depth(list())
list_depth(list(), prune_empty_elts = TRUE)



