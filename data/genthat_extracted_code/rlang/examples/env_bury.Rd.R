library(rlang)


### Name: env_bury
### Title: Mask bindings by defining symbols deeper in a scope
### Aliases: env_bury

### ** Examples

orig_env <- env(a = 10)
fn <- set_env(function() a, orig_env)

# fn() currently sees `a` as the value `10`:
fn()

# env_bury() will bury the current scope of fn() behind a new
# environment:
fn <- env_bury(fn, a = 1000)
fn()

# Even though the symbol `a` is still defined deeper in the scope:
orig_env$a



