library(sdcHierarchies)


### Name: hier_nodenames
### Title: Extract name of nodes (levels)
### Aliases: hier_nodenames

### ** Examples

h <- hier_create(root = "Total",  nodes = LETTERS[1:3])
h <- hier_add(h, root = "A", nodes = c("a1", "a5"))
hier_nodenames(h)



