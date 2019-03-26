library(rlang)


### Name: fn_env
### Title: Return the closure environment of a function
### Aliases: fn_env fn_env<-

### ** Examples

env <- child_env("base")
fn <- with_env(env, function() NULL)
identical(fn_env(fn), env)

other_env <- child_env("base")
fn_env(fn) <- other_env
identical(fn_env(fn), other_env)



