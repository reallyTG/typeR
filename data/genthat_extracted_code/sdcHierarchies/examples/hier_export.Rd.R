library(sdcHierarchies)


### Name: hier_export
### Title: Export a hierarchy into a file
### Aliases: hier_export

### ** Examples

h <- hier_create(root = "Total", nodes = LETTERS[1:2])
h <- hier_add(h, root = "A", nodes = c("a1", "a2"))
h <- hier_add(h, root = "B", nodes = c("b1", "b2"))
h <- hier_add(h, root = "b1", nodes = "b1a")
hier_display(h)

# export as input for tauArgus
hier_export(h, as = "argus", path = file.path(tempdir(), "h.hrc"))



