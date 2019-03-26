library(sdcHierarchies)


### Name: hier_to_tree
### Title: Convert a nested hierarchy into the default format
### Aliases: hier_to_tree

### ** Examples

h <- hier_create(root = "Total",  nodes = LETTERS[1:3])
h <- hier_add(h, root = "A", nodes = c("a1", "a5"))
sdc <- hier_convert(h, as = "sdc")
hier_display(h)
hier_display(hier_to_tree(h))
hier_display(hier_to_tree(sdc))



