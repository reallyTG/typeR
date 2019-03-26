library(arules)


### Name: read.PMML
### Title: Read and Write PMML
### Aliases: read.PMML write.PMML
### Keywords: interface

### ** Examples

data("Groceries")

rules <- apriori(Groceries, parameter=list(support=0.001))
rules <- head(rules, by="lift")
rules

### save rules as PMML
write.PMML(rules, file = "rules.xml")

### read rules back
rules2 <- read.PMML("rules.xml")
rules2

### compare rules
inspect(rules[1])
inspect(rules2[1])

### clean up
unlink("rules.xml")



