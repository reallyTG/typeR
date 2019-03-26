library(rlang)


### Name: quotation
### Title: Quotation
### Aliases: quotation expr enexpr exprs enexprs ensym ensyms quo enquo
###   quos enquos

### ** Examples

# expr() and exprs() capture expressions that you supply:
expr(symbol)
exprs(several, such, symbols)

# enexpr() and enexprs() capture expressions that your user supplied:
expr_inputs <- function(arg, ...) {
  user_exprs <- enexprs(arg, ...)
  user_exprs
}
expr_inputs(hello)
expr_inputs(hello, bonjour, ciao)

# ensym() and ensyms() provide additional type checking to ensure
# the user calling your function has supplied bare object names:
sym_inputs <- function(...) {
  user_symbols <- ensyms(...)
  user_symbols
}
sym_inputs(hello, "bonjour")
## sym_inputs(say(hello))  # Error: Must supply symbols or strings
expr_inputs(say(hello))


# All these quoting functions have quasiquotation support. This
# means that you can unquote (evaluate and inline) part of the
# captured expression:
what <- sym("bonjour")
expr(say(what))
expr(say(!!what))

# This also applies to expressions supplied by the user. This is
# like an escape hatch that allows control over the captured
# expression:
expr_inputs(say(!!what), !!what)


# Finally, you can capture expressions as quosures. A quosure is an
# object that contains both the expression and its environment:
quo <- quo(letters)
quo

get_expr(quo)
get_env(quo)

# Quosures can be evaluated with eval_tidy():
eval_tidy(quo)

# They have the nice property that you can pass them around from
# context to context (that is, from function to function) and they
# still evaluate in their original environment:
multiply_expr_by_10 <- function(expr) {
  # We capture the user expression and its environment:
  expr <- enquo(expr)

  # Then create an object that only exists in this function:
  local_ten <- 10

  # Now let's create a multiplication expression that (a) inlines
  # the user expression as LHS (still wrapped in its quosure) and
  # (b) refers to the local object in the RHS:
  quo(!!expr * local_ten)
}
quo <- multiply_expr_by_10(2 + 3)

# The local parts of the quosure are printed in colour if your
# terminal is capable of displaying colours:
quo

# All the quosures in the expression evaluate in their original
# context. The local objects are looked up properly and we get the
# expected result:
eval_tidy(quo)



