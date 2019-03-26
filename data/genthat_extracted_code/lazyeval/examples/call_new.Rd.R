library(lazyeval)


### Name: call_new
### Title: Create a call by "hand"
### Aliases: call_new

### ** Examples

# f can either be a string, a symbol or a call
call_new("f", a = 1)
call_new(quote(f), a = 1)
call_new(quote(f()), a = 1)

#' Can supply arguments individually or in a list
call_new(quote(f), a = 1, b = 2)
call_new(quote(f), .args = list(a = 1, b = 2))



