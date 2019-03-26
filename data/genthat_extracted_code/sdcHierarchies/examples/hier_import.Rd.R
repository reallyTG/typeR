library(sdcHierarchies)


### Name: hier_import
### Title: Imports a nested data structure
### Aliases: hier_import

### ** Examples

h <- hier_create(root = "Total", nodes = LETTERS[1:2])
h <- hier_add(h, root = "A", nodes = c("a1", "a2"))
h <- hier_add(h, root = "B", nodes = c("b1", "b2"))
h <- hier_add(h, root = "b1", nodes = "b1a")
hier_display(h)

df <- hier_convert(h, as = "df")
hier_display(df)

h2 <- hier_import(df, from = "df")
hier_display(h2)



