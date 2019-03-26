library(wrapr)


### Name: apply_right_S4
### Title: S4 dispatch method for apply_right.
### Aliases: apply_right_S4

### ** Examples


a <- data.frame(x = 1)
b <- data.frame(x = 2)

# a %.>% b # will (intentionally) throw

setMethod(
  "apply_right_S4",
  signature("data.frame", "data.frame"),
  function(pipe_left_arg,
           pipe_right_arg,
           pipe_environment,
           left_arg_name,
           pipe_string,
           right_arg_name) {
    rbind(pipe_left_arg, pipe_right_arg)
  })


a %.>% b # should equal data.frame(x = c(1, 2))




