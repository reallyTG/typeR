library(arules)


### Name: ruleInduction
### Title: Rule Induction from Itemsets
### Aliases: ruleInduction ruleInduction,itemsets-method
### Keywords: models

### ** Examples

data("Adult")

## find all closed frequent itemsets
closed_is <- apriori(Adult, 
	parameter = list(target = "closed frequent itemsets", support = 0.4))
closed_is

## use rule induction to produce all closed association rules
closed_rules <- ruleInduction(closed_is, Adult, 
  control = list(verbose = TRUE))

## X&Y are already closed, check that X is also closed
closed_rules[is.element(lhs(closed_rules), items(closed_is))]

## inspect the resulting closed rules
summary(closed_rules)
inspect(head(closed_rules, by = "lift"))

## use lattice of frequent itemsets
ec  <- eclat(Adult, parameter = list(support = 0.4))
rec <- ruleInduction(ec)
rec
inspect(head(rec))



