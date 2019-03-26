library(assertive.code)


### Name: assert_is_binding_locked
### Title: Is the binding of a variable locked?
### Aliases: assert_is_binding_locked is_binding_locked

### ** Examples

is_binding_locked(a_non_existent_variable)
e <- new.env()
e$x <- 1:10
is_binding_locked(x, e)
lockBinding("x", e)
is_binding_locked(x, e)
unlockBinding("x", e)
is_binding_locked(x, e)



