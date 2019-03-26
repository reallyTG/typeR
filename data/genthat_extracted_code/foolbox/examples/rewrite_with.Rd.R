library(foolbox)


### Name: rewrite_with
### Title: Functions for applying a sequence of rewrites.
### Aliases: rewrite_with rewrite analyse analyse_with rewrite_expr
###   rewrite_expr_with analyse_expr analyse_expr_with

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




