library(foolbox)


### Name: add_call_callback
### Title: Add a function-specific callback to the call callbacks.
### Aliases: add_call_callback

### ** Examples

f <- function(x) 2 + x
cb <- rewrite_callbacks() %>%
   add_call_callback(f, function(expr, ...) {
       quote(2 + x)
   })
tr_f <- . %>% rewrite() %>% rewrite_with(cb)

g <- function(y) y + f(y)
tr_f(g)




