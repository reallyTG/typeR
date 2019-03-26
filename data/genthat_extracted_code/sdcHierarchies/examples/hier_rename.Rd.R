library(sdcHierarchies)


### Name: hier_rename
### Title: Rename nodes in an existing hierarchy
### Aliases: hier_rename

### ** Examples

h <- hier_create(root = "Total",  nodes = LETTERS[1:3])
h <- hier_add(h, root = "A", nodes = c("a1", "a5"))
hier_display(h)

h <- hier_rename(h, nodes = c("a1" = "x1", "A" = "X"))
hier_display(h)



