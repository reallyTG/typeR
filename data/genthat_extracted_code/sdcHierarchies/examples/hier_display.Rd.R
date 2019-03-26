library(sdcHierarchies)


### Name: hier_display
### Title: Displays the hierarchy
### Aliases: hier_display

### ** Examples

h <- hier_create(root = "Total", nodes = LETTERS[1:2])
h <- hier_add(h, root = "A", nodes = c("a1", "a2"))

# display the entire tree
hier_display(h)

# display only a subtree
hier_display(h, root = "A")



