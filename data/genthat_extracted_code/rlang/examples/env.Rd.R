library(rlang)


### Name: env
### Title: Create a new environment
### Aliases: env child_env new_environment

### ** Examples

# env() creates a new environment which has the current environment
# as parent
env <- env(a = 1, b = "foo")
env$b
identical(env_parent(env), current_env())

# Supply one unnamed argument to override the default:
env <- env(base_env(), a = 1, b = "foo")
identical(env_parent(env), base_env())


# child_env() lets you specify a parent:
child <- child_env(env, c = "bar")
identical(env_parent(child), env)

# This child environment owns `c` but inherits `a` and `b` from `env`:
env_has(child, c("a", "b", "c", "d"))
env_has(child, c("a", "b", "c", "d"), inherit = TRUE)

# `parent` is passed to as_environment() to provide handy
# shortcuts. Pass a string to create a child of a package
# environment:
child_env("rlang")
env_parent(child_env("rlang"))

# Or `NULL` to create a child of the empty environment:
child_env(NULL)
env_parent(child_env(NULL))

# The base package environment is often a good default choice for a
# parent environment because it contains all standard base
# functions. Also note that it will never inherit from other loaded
# package environments since R keeps the base package at the tail
# of the search path:
base_child <- child_env("base")
env_has(base_child, c("lapply", "("), inherit = TRUE)

# On the other hand, a child of the empty environment doesn't even
# see a definition for `(`
empty_child <- child_env(NULL)
env_has(empty_child, c("lapply", "("), inherit = TRUE)

# Note that all other package environments inherit from base_env()
# as well:
rlang_child <- child_env("rlang")
env_has(rlang_child, "env", inherit = TRUE)     # rlang function
env_has(rlang_child, "lapply", inherit = TRUE)  # base function


# Both env() and child_env() support tidy dots features:
objs <- list(b = "foo", c = "bar")
env <- env(a = 1, !!! objs)
env$c

# You can also unquote names with the definition operator `:=`
var <- "a"
env <- env(!!var := "A")
env$a


# Use new_environment() to create containers with the empty
# environment as parent:
env <- new_environment()
env_parent(env)

# Like other new_ constructors, it takes an object rather than dots:
new_environment(list(a = "foo", b = "bar"))



