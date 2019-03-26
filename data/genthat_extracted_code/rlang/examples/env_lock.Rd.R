library(rlang)


### Name: env_lock
### Title: Lock an environment
### Aliases: env_lock env_is_locked

### ** Examples

# New environments are unlocked by default:
env <- env(a = 1)
env_is_locked(env)

# Use env_lock() to lock them:
env_lock(env)
env_is_locked(env)

# Now that `env` is locked, it is no longer possible to remove or
# add bindings. If run, the following would fail:
# env_unbind(env, "a")
# env_bind(env, b = 2)

# Note that even though the environment as a container is locked,
# the individual bindings are still unlocked and can be modified:
env$a <- 10



