library(validatetools)


### Name: simplify_rules
### Title: Simplify a rule set
### Aliases: simplify_rules

### ** Examples

rules <- validator( x > 0
                  , if (x > 0) y == 1
                  , A %in% c("a1", "a2")
                  , if (A == "a1") y > 1
                  )

simplify_rules(rules)




