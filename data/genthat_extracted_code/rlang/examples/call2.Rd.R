library(rlang)


### Name: call2
### Title: Create a call
### Aliases: call2

### ** Examples

# fn can either be a string, a symbol or a call
call2("f", a = 1)
call2(quote(f), a = 1)
call2(quote(f()), a = 1)

#' Can supply arguments individually or in a list
call2(quote(f), a = 1, b = 2)
call2(quote(f), !!!list(a = 1, b = 2))

# Creating namespaced calls is easy:
call2("fun", arg = quote(baz), .ns = "mypkg")



