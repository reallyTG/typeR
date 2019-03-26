library(sdcHierarchies)


### Name: hier_add
### Title: Add nodes to an existing hierarchy
### Aliases: hier_add

### ** Examples

h <- hier_create(root = "Total",  nodes = LETTERS[1:3])
h <- hier_add(h, root = "A", nodes = c("a1", "a5"))
hier_display(h)



