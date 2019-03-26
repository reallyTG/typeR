library(arules)


### Name: apriori
### Title: Mining Associations with Apriori
### Aliases: apriori
### Keywords: models

### ** Examples

data("Adult")
## Mine association rules.
rules <- apriori(Adult, 
	parameter = list(supp = 0.5, conf = 0.9, target = "rules"))
summary(rules)



