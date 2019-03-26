library(rlang)


### Name: is_call
### Title: Is object a call?
### Aliases: is_call

### ** Examples

is_call(quote(foo(bar)))

# You can pattern-match the call with additional arguments:
is_call(quote(foo(bar)), "foo")
is_call(quote(foo(bar)), "bar")
is_call(quote(foo(bar)), quote(foo))

# Match the number of arguments with is_call():
is_call(quote(foo(bar)), "foo", 1)
is_call(quote(foo(bar)), "foo", 2)


# By default, namespaced calls are tested unqualified:
ns_expr <- quote(base::list())
is_call(ns_expr, "list")

# You can also specify whether the call shouldn't be namespaced by
# supplying an empty string:
is_call(ns_expr, "list", ns = "")

# Or if it should have a namespace:
is_call(ns_expr, "list", ns = "utils")
is_call(ns_expr, "list", ns = "base")

# You can supply multiple namespaces:
is_call(ns_expr, "list", ns = c("utils", "base"))
is_call(ns_expr, "list", ns = c("utils", "stats"))

# If one of them is "", unnamespaced calls will match as well:
is_call(quote(list()), "list", ns = "base")
is_call(quote(list()), "list", ns = c("base", ""))
is_call(quote(base::list()), "list", ns = c("base", ""))


# The name argument is vectorised so you can supply a list of names
# to match with:
is_call(quote(foo(bar)), c("bar", "baz"))
is_call(quote(foo(bar)), c("bar", "foo"))
is_call(quote(base::list), c("::", ":::", "$", "@"))



