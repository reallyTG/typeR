library(arules)


### Name: unique
### Title: Remove Duplicated Elements from a Collection
### Aliases: unique unique,associations-method unique,itemMatrix-method
### Keywords: manip

### ** Examples

data("Adult")

r1 <- apriori(Adult[1:1000], parameter = list(support = 0.5))
r2 <- apriori(Adult[1001:2000], parameter = list(support = 0.5))

## Note that this produces a collection of rules from two sets
r_comb <- c(r1, r2)
r_comb <- unique(r_comb)
r_comb




