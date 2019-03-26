library(wrapr)


### Name: stop_if_dot_args
### Title: Stop with message if dot_args is a non-trivial list.
### Aliases: stop_if_dot_args

### ** Examples


f <- function(x, ..., inc = 1) {
   stop_if_dot_args(substitute(list(...)), "f")
   x + inc
}
f(7)
f(7, inc = 2)
tryCatch(
  f(7, 2),
  error = function(e) { print(e) }
)




