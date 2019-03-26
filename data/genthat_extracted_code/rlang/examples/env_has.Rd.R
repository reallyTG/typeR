library(rlang)


### Name: env_has
### Title: Does an environment have or see bindings?
### Aliases: env_has

### ** Examples

parent <- child_env(NULL, foo = "foo")
env <- child_env(parent, bar = "bar")

# env does not own `foo` but sees it in its parent environment:
env_has(env, "foo")
env_has(env, "foo", inherit = TRUE)



