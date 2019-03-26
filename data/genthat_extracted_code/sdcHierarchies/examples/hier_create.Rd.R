library(sdcHierarchies)


### Name: hier_create
### Title: Create a hierarchy
### Aliases: hier_create

### ** Examples

# without nodes
h <- hier_create(root = "tot")
hier_display(h)

# with nodes
h <- hier_create(root = "tot", nodes = LETTERS[1:5])
hier_display(h)



