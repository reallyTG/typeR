library(rlang)


### Name: is_callable
### Title: Is an object callable?
### Aliases: is_callable

### ** Examples

# Symbolic objects and functions are callable:
is_callable(quote(foo))
is_callable(base::identity)

# node_poke_car() lets you modify calls without any checking:
lang <- quote(foo(10))
node_poke_car(lang, current_env())

# Use is_callable() to check an input object is safe to put as CAR:
obj <- base::identity

if (is_callable(obj)) {
  lang <- node_poke_car(lang, obj)
} else {
  abort("`obj` must be callable")
}

eval_bare(lang)



