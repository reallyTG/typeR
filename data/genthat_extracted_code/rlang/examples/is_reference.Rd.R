library(rlang)


### Name: is_reference
### Title: Is an object referencing another?
### Aliases: is_reference

### ** Examples

# Reassigning an uncopyable object such as an environment creates a
# reference:
env <- env()
ref <- env
is_reference(ref, env)

# Due to copy-on-write optimisation, a copied vector can
# temporarily reference the original vector:
vec <- 1:10
copy <- vec
is_reference(copy, vec)

# Once you modify on of them, the copy is triggered in the
# background and the objects cease to reference each other:
vec[[1]] <- 100
is_reference(copy, vec)



