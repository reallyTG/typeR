library(rlang)


### Name: is_formula
### Title: Is object a formula?
### Aliases: is_formula is_bare_formula

### ** Examples

x <- disp ~ am
is_formula(x)

is_formula(~10)
is_formula(10)

is_formula(quo(foo))
is_bare_formula(quo(foo))

# Note that unevaluated formulas are treated as bare formulas even
# though they don't inherit from "formula":
f <- quote(~foo)
is_bare_formula(f)

# However you can specify `scoped` if you need the predicate to
# return FALSE for these unevaluated formulas:
is_bare_formula(f, scoped = TRUE)
is_bare_formula(eval(f), scoped = TRUE)



