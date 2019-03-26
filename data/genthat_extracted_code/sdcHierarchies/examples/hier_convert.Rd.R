library(sdcHierarchies)


### Name: hier_convert
### Title: Converts hierarchies into different formats
### Aliases: hier_convert

### ** Examples

h <- hier_create(root = "Total", nodes = LETTERS[1:2])
h <- hier_add(h, root = "A", nodes = c("a1", "a2"))
h <- hier_add(h, root = "B", nodes = c("b1", "b2"))
h <- hier_add(h, root = "b1", nodes = "b1a")
hier_display(h)

# required code to build the hierarchy
hier_convert(h, as = "code")

# data.frame
hier_convert(h, as = "df")



