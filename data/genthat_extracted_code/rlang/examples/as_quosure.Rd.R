library(rlang)


### Name: as_quosure
### Title: Coerce object to quosure
### Aliases: as_quosure new_quosure

### ** Examples

# as_quosure() converts expressions or any R object to a validly
# scoped quosure:
env <- env(var = "thing")
as_quosure(quote(var), env)


# The environment is ignored for formulas:
as_quosure(~foo, env)
as_quosure(~foo)

# However you must supply it for symbols and calls:
try(as_quosure(quote(var)))



