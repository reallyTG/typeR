library(vcr)


### Name: Hooks
### Title: Hooks class
### Aliases: Hooks
### Keywords: internal

### ** Examples

## Not run: 
##D (x <- Hooks$new())
##D x$hooks
##D x$define_hook(hook_type = "foo", fun = function(x) x ^ 2)
##D x$hooks$foo(4)
##D x$clear_hooks()
##D x$hooks
## End(Not run)



