library(rlang)


### Name: switch_lang
### Title: Dispatch on call type
### Aliases: switch_lang coerce_lang lang_type_of
### Keywords: internal

### ** Examples

# Named calls:
lang_type_of(~foo())

# Recursive calls:
lang_type_of(~foo$bar())
lang_type_of(~foo()())

# Namespaced calls:
lang_type_of(~base::list())

# For an inlined call, let's inline a function in the head node:
call <- quote(foo(letters))
call[[1]] <- base::toupper

call
lang_type_of(call)



