library(wrapr)


### Name: apply_right.default
### Title: Default apply_right implementation.
### Aliases: apply_right.default

### ** Examples


# simulate a function pointer
apply_right.list <- function(pipe_left_arg,
                             pipe_right_arg,
                             pipe_environment,
                             left_arg_name,
                             pipe_string,
                             right_arg_name) {
  pipe_right_arg$f(pipe_left_arg)
}

f <- list(f=sin)
2 %.>% f
f$f <- cos
2 %.>% f




