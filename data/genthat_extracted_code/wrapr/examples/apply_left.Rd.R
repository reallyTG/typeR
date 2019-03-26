library(wrapr)


### Name: apply_left
### Title: S3 dispatch on class of pipe_left_arg.
### Aliases: apply_left

### ** Examples


apply_left.character <- function(pipe_left_arg,
                                 pipe_right_arg,
                                 pipe_environment,
                                 left_arg_name,
                                 pipe_string,
                                 right_arg_name) {
  if(is.language(pipe_right_arg)) {
    wrapr::apply_left_default(pipe_left_arg,
                              pipe_right_arg,
                              pipe_environment,
                              left_arg_name,
                              pipe_string,
                              right_arg_name)
  } else {
    paste(pipe_left_arg, pipe_right_arg)
  }
}
setMethod(
  wrapr::apply_right_S4,
  signature = c(pipe_left_arg = "character", pipe_right_arg = "character"),
  function(pipe_left_arg,
           pipe_right_arg,
           pipe_environment,
           left_arg_name,
           pipe_string,
           right_arg_name) {
    paste(pipe_left_arg, pipe_right_arg)
  })

"a" %.>% 5 %.>% 7

"a" %.>% toupper(.)

q <- "z"
"a" %.>% q





