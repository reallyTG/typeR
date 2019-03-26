library(validatetools)


### Name: simplify_fixed_variables
### Title: Simplify fixed variables
### Aliases: simplify_fixed_variables

### ** Examples

library(validate)
rules <- validator( x >= 0
                  , x <= 0
                  )
detect_fixed_variables(rules)
simplify_fixed_variables(rules)

rules <- validator( x1 + x2 + x3 == 0
                  , x1 + x2 >= 0
                  , x3 >= 0
                  )
simplify_fixed_variables(rules)



