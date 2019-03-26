library(rlang)


### Name: env_get
### Title: Get an object in an environment
### Aliases: env_get env_get_list

### ** Examples

parent <- child_env(NULL, foo = "foo")
env <- child_env(parent, bar = "bar")

# This throws an error because `foo` is not directly defined in env:
# env_get(env, "foo")

# However `foo` can be fetched in the parent environment:
env_get(env, "foo", inherit = TRUE)

# You can also avoid an error by supplying a default value:
env_get(env, "foo", default = "FOO")



