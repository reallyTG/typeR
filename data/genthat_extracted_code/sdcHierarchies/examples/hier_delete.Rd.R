library(sdcHierarchies)


### Name: hier_delete
### Title: Delete nodes from an existing hierarchy
### Aliases: hier_delete

### ** Examples

h <- hier_create(root = "Total", nodes = LETTERS[1:2])
h <- hier_add(h, root = "A", nodes = c("a1", "a2"))
h <- hier_add(h, root = "B", nodes = c("b1", "b2"))
h <- hier_add(h, root = "b1", nodes = "b1a")
hier_display(h)

h <- hier_delete(h, nodes = c("a1", "b1a"))
hier_display(h)



