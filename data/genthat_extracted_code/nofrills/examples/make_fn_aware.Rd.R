library(nofrills)


### Name: make_fn_aware
### Title: Make a function aware of abbreviated functional arguments
### Aliases: make_fn_aware

### ** Examples

reduce <- make_fn_aware(Reduce, "f")

## reduce() behaves just like Reduce()
Reduce(function(u, v) u + 1 / v, c(3, 7, 15, 1, 292), right = TRUE)
reduce(function(u, v) u + 1 / v, c(3, 7, 15, 1, 292), right = TRUE)

## reduce() can also interpret abbreviated function expressions
reduce(.(u, v ~ u + 1 / v), c(3, 7, 15, 1, 292), right = TRUE)




