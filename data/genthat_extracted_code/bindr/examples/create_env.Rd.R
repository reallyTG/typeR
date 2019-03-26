library(bindr)


### Name: create_env
### Title: Create or populate an environment with parametrized active
###   bindings
### Aliases: create_env populate_env

### ** Examples

env <- create_env(letters, paste0, "-lowercase")
env$a
env$c
env$Z
populate_env(env, LETTERS, paste0, "-uppercase")
env$a
env$Z



