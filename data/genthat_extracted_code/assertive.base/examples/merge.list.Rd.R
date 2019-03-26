library(assertive.base)


### Name: merge.list
### Title: Merge two lists
### Aliases: merge.list

### ** Examples

merge(
  list(foo = 1, bar = 2, baz = 3), 
  list(foo = 4, baz = 5, quux = 6)
)

# If unnamed elements are allowed, they are included at the end
merge(
  list("a", foo = 1, "b", bar = 2, baz = 3, "c"), 
  list(foo = 4, "a", baz = 5, "b", quux = 6, "d"),
  allow_unnamed_elements = TRUE
)



