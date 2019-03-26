library(rlang)


### Name: box
### Title: Box a value
### Aliases: box new_box is_box unbox

### ** Examples

boxed <- new_box(letters, "mybox")
is_box(boxed)
is_box(boxed, "mybox")
is_box(boxed, "otherbox")

unbox(boxed)

# as_box() avoids double-boxing:
boxed2 <- as_box(boxed, "mybox")
boxed2
unbox(boxed2)

# Compare to:
boxed_boxed <- new_box(boxed, "mybox")
boxed_boxed
unbox(unbox(boxed_boxed))

# Use `as_box_if()` with a predicate if you need to ensure a box
# only for a subset of values:
as_box_if(NULL, is_null, "null_box")
as_box_if("foo", is_null, "null_box")



