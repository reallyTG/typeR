library(foolbox)


### Name: rewrite_callbacks
### Title: Default expression-transformation callbacks.
### Aliases: rewrite_callbacks analysis_callbacks with_atomic_callback
###   with_pairlist_callback with_symbol_callback with_primitive_callback
###   with_call_callback with_topdown_pairlist_callback
###   with_topdown_call_callback

### ** Examples

f <- function(x) 2 + x
cb <- rewrite_callbacks() %>%
   add_call_callback(f, function(expr, ...) {
       quote(2 + x)
   })
tr_f <- . %>% rewrite() %>% rewrite_with(cb)

g <- function(y) y + f(y)
tr_f(g)

collect_symbols <- function(expr, ...) {
   list(symbols = as.character(expr))
}
callbacks <- analysis_callbacks() %>% with_symbol_callback(collect_symbols)
f %>% analyse() %>% analyse_with(callbacks)




