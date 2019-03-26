library(rlang)


### Name: as_name
### Title: Extract names from symbols
### Aliases: as_name

### ** Examples

# Let's create some symbols:
foo <- quote(foo)
bar <- sym("bar")

# as_name() converts symbols to strings:
foo
as_name(foo)

typeof(bar)
typeof(as_name(bar))

# as_name() unwraps quosured symbols automatically:
as_name(quo(foo))



