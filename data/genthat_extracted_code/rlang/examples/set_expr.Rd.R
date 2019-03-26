library(rlang)


### Name: set_expr
### Title: Set and get an expression
### Aliases: set_expr get_expr

### ** Examples

f <- ~foo(bar)
e <- quote(foo(bar))
frame <- identity(identity(ctxt_frame()))

get_expr(f)
get_expr(e)
get_expr(frame)

set_expr(f, quote(baz))
set_expr(e, quote(baz))



