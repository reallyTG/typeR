library(arules)


### Name: duplicated
### Title: Find Duplicated Elements
### Aliases: duplicated duplicated,itemsets-method duplicated,rules-method
###   duplicated,itemMatrix-method
### Keywords: manip

### ** Examples

data("Adult")

r1 <- apriori(Adult[1:1000], parameter = list(support = 0.5))
r2 <- apriori(Adult[1001:2000], parameter = list(support = 0.5))

## Note this creates a collection of rules from two sets of rules
r_comb <- c(r1, r2)
duplicated(r_comb)




