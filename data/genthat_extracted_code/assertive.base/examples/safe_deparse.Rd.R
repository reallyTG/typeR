library(assertive.base)


### Name: safe_deparse
### Title: Safe version of deparse
### Aliases: safe_deparse

### ** Examples

# safe_deparse only differs from deparse when the deparse string is longer
# than width.cutoff
deparse(CO2, width.cutoff = 500L) # has length 6
safe_deparse(CO2)                 # has length 1



