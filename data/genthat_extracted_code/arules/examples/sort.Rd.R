library(arules)


### Name: sort
### Title: Sort Associations
### Aliases: sort SORT SORT,associations-method sort,associations-method
###   head head,associations-method tail tail,associations-method
### Keywords: manip arith

### ** Examples

data("Adult")

## Mine rules with APRIORI
rules <- apriori(Adult, parameter = list(supp = 0.6))

rules_by_lift <- sort(rules, by = "lift")

inspect(head(rules))
inspect(head(rules_by_lift))

## A faster/less memory consuming way to get the top 5 rules according to lift 
## (see Details section)
inspect(head(rules, n = 5, by = "lift"))



