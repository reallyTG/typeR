library(rlang)


### Name: op-definition
### Title: Definition operator
### Aliases: op-definition is_definition new_definition is_formulaish
### Keywords: internal

### ** Examples


# A predicate is provided to distinguish formulas from the
# colon-equals operator:
is_definition(quote(a := b))
is_definition(a ~ b)


# is_formulaish() tests for both definitions and formulas:
is_formulaish(a ~ b)
is_formulaish(quote(a := b))



