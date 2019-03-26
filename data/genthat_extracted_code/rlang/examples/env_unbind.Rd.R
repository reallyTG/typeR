library(rlang)


### Name: env_unbind
### Title: Remove bindings from an environment
### Aliases: env_unbind

### ** Examples

data <- set_names(as_list(letters), letters)
env_bind(environment(), !!! data)
env_has(environment(), letters)

# env_unbind() removes bindings:
env_unbind(environment(), letters)
env_has(environment(), letters)

# With inherit = TRUE, it removes bindings in parent environments
# as well:
parent <- child_env(NULL, foo = "a")
env <- child_env(parent, foo = "b")
env_unbind(env, "foo", inherit = TRUE)
env_has(env, "foo", inherit = TRUE)



