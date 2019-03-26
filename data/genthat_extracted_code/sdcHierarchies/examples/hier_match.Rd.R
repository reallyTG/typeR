library(sdcHierarchies)


### Name: hier_match
### Title: Match default and original node labels
### Aliases: hier_match

### ** Examples

h <- hier_create(root = "Tot", nodes = letters[1:5])
h <- hier_add(h, root = "a", nodes = "a0")
h2 <- hier_convert(tree = h, as = "dt")
hier_match(tree = h, nodes = c("a", "b"), inputs = "orig")
hier_match(tree = h2, nodes = c("01", "02"), inputs = "default")



