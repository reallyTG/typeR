library(SDEFSR)


### Name: [.SDEFSR_Rules
### Title: Filter rules in a 'SDEFSR_Rules' object returning a new
###   'SDEFSR_Rules' object
### Aliases: [.SDEFSR_Rules

### ** Examples

library(SDEFSR)
#Apply filter by unusualness
habermanRules[Unusualness > 0.05]

#Also, you can make the filter as complex as you can
#Filter by Unusualness and TPr
habermanRules[Unusualness > 0.05 & TPr > 0.9]





