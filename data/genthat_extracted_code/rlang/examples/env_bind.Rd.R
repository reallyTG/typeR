library(rlang)


### Name: env_bind
### Title: Bind symbols to objects in an environment
### Aliases: env_bind env_bind_lazy env_bind_active

### ** Examples

# env_bind() is a programmatic way of assigning values to symbols
# with `<-`. We can add bindings in the current environment:
env_bind(current_env(), foo = "bar")
foo

# Or modify those bindings:
bar <- "bar"
env_bind(current_env(), bar = "BAR")
bar

# You can remove bindings by supplying zap sentinels:
env_bind(current_env(), foo = zap())
try(foo)

# Unquote-splice a named list of zaps
zaps <- rep_named(c("foo", "bar"), list(zap()))
env_bind(current_env(), !!!zaps)
try(bar)

# It is most useful to change other environments:
my_env <- env()
env_bind(my_env, foo = "foo")
my_env$foo

# A useful feature is to splice lists of named values:
vals <- list(a = 10, b = 20)
env_bind(my_env, !!!vals, c = 30)
my_env$b
my_env$c

# You can also unquote a variable referring to a symbol or a string
# as binding name:
var <- "baz"
env_bind(my_env, !!var := "BAZ")
my_env$baz


# The old values of the bindings are returned invisibly:
old <- env_bind(my_env, a = 1, b = 2, baz = "baz")
old

# You can restore the original environment state by supplying the
# old values back:
env_bind(my_env, !!!old)

# env_bind_lazy() assigns expressions lazily:
env <- env()
env_bind_lazy(env, name = { cat("forced!\n"); "value" })

# Referring to the binding will cause evaluation:
env$name

# But only once, subsequent references yield the final value:
env$name

# You can unquote expressions:
expr <- quote(message("forced!"))
env_bind_lazy(env, name = !!expr)
env$name


# By default the expressions are evaluated in the current
# environment. For instance we can create a local binding and refer
# to it, even though the variable is bound in a different
# environment:
who <- "mickey"
env_bind_lazy(env, name = paste(who, "mouse"))
env$name

# You can specify another evaluation environment with `.eval_env`:
eval_env <- env(who = "minnie")
env_bind_lazy(env, name = paste(who, "mouse"), .eval_env = eval_env)
env$name

# Or by unquoting a quosure:
quo <- local({
  who <- "fievel"
  quo(paste(who, "mouse"))
})
env_bind_lazy(env, name = !!quo)
env$name

# You can create active bindings with env_bind_active(). Active
# bindings execute a function each time they are evaluated:
fn <- function() {
  cat("I have been called\n")
  rnorm(1)
}

env <- env()
env_bind_active(env, symbol = fn)

# `fn` is executed each time `symbol` is evaluated or retrieved:
env$symbol
env$symbol
eval_bare(quote(symbol), env)
eval_bare(quote(symbol), env)

# All arguments are passed to as_function() so you can use the
# formula shortcut:
env_bind_active(env, foo = ~ runif(1))
env$foo
env$foo



