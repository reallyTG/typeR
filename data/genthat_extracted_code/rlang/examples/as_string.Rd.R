library(rlang)


### Name: as_string
### Title: Cast symbol to string
### Aliases: as_string

### ** Examples

# Let's create some symbols:
foo <- quote(foo)
bar <- sym("bar")

# as_string() converts symbols to strings:
foo
as_string(foo)

typeof(bar)
typeof(as_string(bar))



