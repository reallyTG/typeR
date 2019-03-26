library(rlang)


### Name: as_label
### Title: Create a default name for an R object
### Aliases: as_label

### ** Examples

# as_label() is useful with quoted expressions:
as_label(expr(foo(bar)))
as_label(expr(foobar))

# It works with any R object. This is also useful for quoted
# arguments because the user might unquote constant objects:
as_label(1:3)
as_label(base::list)



