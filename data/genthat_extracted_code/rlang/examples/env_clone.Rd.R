library(rlang)


### Name: env_clone
### Title: Clone an environment
### Aliases: env_clone

### ** Examples

env <- env(!!! mtcars)
clone <- env_clone(env)
identical(env, clone)
identical(env$cyl, clone$cyl)



