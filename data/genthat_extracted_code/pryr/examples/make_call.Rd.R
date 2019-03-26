library(pryr)


### Name: make_call
### Title: Make and evaluate calls.
### Aliases: make_call do_call

### ** Examples

# f can either be a string, a symbol or a call
make_call("f", a = 1)
make_call(quote(f), a = 1)
make_call(quote(f()), a = 1)

#' Can supply arguments individual or in a list
make_call(quote(f), a = 1, b = 2)
make_call(quote(f), list(a = 1, b = 2))



