library(sdcHierarchies)


### Name: hier_info
### Title: hier_info
### Aliases: hier_info

### ** Examples

h <- hier_create(root = "Total",  nodes = LETTERS[1:3])
h <- hier_add(h, root = "A", nodes = c("a1", "a5"))
hier_display(h)

# about a specific node
hier_info(h, nodes = "a1")

# about all nodes
hier_info(h)



