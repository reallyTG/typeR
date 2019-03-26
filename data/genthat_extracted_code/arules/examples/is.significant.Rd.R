library(arules)


### Name: is.significant
### Title: Find Significant Rules
### Aliases: is.significant is.significant,rules-method
### Keywords: manip

### ** Examples

data("Income")
rules <- apriori(Income, parameter = list(support = 0.5))
is.significant(rules, Income)

inspect(rules[is.significant(rules, Income)])



