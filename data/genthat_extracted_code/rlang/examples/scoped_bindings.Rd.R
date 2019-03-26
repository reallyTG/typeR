library(rlang)


### Name: scoped_bindings
### Title: Temporarily change bindings of an environment
### Aliases: scoped_bindings with_bindings

### ** Examples

foo <- "foo"
bar <- "bar"

# `foo` will be temporarily rebinded while executing `expr`
with_bindings(paste(foo, bar), foo = "rebinded")
paste(foo, bar)



