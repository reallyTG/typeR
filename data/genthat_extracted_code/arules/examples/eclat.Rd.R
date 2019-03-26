library(arules)


### Name: eclat
### Title: Mining Associations with Eclat
### Aliases: eclat
### Keywords: models

### ** Examples

data("Adult")
## Mine itemsets with minimum support of 0.1 and 5 or less items
itemsets <- eclat(Adult,
		parameter = list(supp = 0.1, maxlen = 5))
itemsets

## Create rules from the itemsets
rules <- ruleInduction(itemsets, Adult, confidence = .9)
rules



