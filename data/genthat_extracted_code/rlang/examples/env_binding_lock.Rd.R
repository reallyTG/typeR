library(rlang)


### Name: env_binding_lock
### Title: Lock or unlock environment bindings
### Aliases: env_binding_lock env_binding_unlock env_binding_are_locked
### Keywords: internal

### ** Examples

# Bindings are unlocked by default:
env <- env(a = "A", b = "B")
env_binding_are_locked(env)

# But can optionally be locked:
env_binding_lock(env, "a")
env_binding_are_locked(env)

# If run, the following would now return an error because `a` is locked:
# env_bind(env, a = "foo")
# with_env(env, a <- "bar")

# Let's unlock it. Note that the return value indicate which
# bindings were locked:
were_locked <- env_binding_unlock(env)
were_locked

# Now that it is unlocked we can modify it again:
env_bind(env, a = "foo")
with_env(env, a <- "bar")
env$a



