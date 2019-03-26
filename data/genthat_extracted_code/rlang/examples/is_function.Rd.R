library(rlang)


### Name: is_function
### Title: Is object a function?
### Aliases: is_function is_closure is_primitive is_primitive_eager
###   is_primitive_lazy

### ** Examples

# Primitive functions are not closures:
is_closure(base::c)
is_primitive(base::c)

# On the other hand, internal functions are wrapped in a closure
# and appear as such from the R side:
is_closure(base::eval)

# Both closures and primitives are functions:
is_function(base::c)
is_function(base::eval)

# Primitive functions never appear in evaluation stacks:
is_primitive(base::`[[`)
is_primitive(base::list)
list(ctxt_stack())[[1]]

# While closures do:
identity(identity(ctxt_stack()))

# Many primitive functions evaluate arguments eagerly:
is_primitive_eager(base::c)
is_primitive_eager(base::list)
is_primitive_eager(base::`+`)

# However, primitives that operate on expressions, like quote() or
# substitute(), are lazy:
is_primitive_lazy(base::quote)
is_primitive_lazy(base::substitute)



