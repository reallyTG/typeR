library(arules)


### Name: coverage
### Title: Calculate coverage for rules
### Aliases: coverage coverage,rules-method
### Keywords: models

### ** Examples

data("Income")

## find and some rules (we only use 5 rules here) and calculate coverage
rules <- apriori(Income)[1:5]
quality(rules) <- cbind(quality(rules), coverage = coverage(rules))

inspect(rules)



