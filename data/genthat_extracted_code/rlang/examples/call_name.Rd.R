library(rlang)


### Name: call_name
### Title: Extract function name or namespaced of a call
### Aliases: call_name call_ns

### ** Examples

# Extract the function name from quoted calls:
call_name(quote(foo(bar)))
call_name(quo(foo(bar)))

# Namespaced calls are correctly handled:
call_name(~base::matrix(baz))

# Anonymous and subsetted functions return NULL:
call_name(quote(foo$bar()))
call_name(quote(foo[[bar]]()))
call_name(quote(foo()()))

# Extract namespace of a call with call_ns():
call_ns(quote(base::bar()))

# If not namespaced, call_ns() returns NULL:
call_ns(quote(bar()))



