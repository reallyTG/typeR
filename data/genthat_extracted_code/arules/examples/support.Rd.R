library(arules)


### Name: support
### Title: Support Counting for Itemsets
### Aliases: support support,itemMatrix-method support,associations-method
### Keywords: models

### ** Examples

data("Income")

## find and some frequent itemsets
itemsets <- eclat(Income)[1:5]

## inspect the support returned by eclat
inspect(itemsets)

## count support in the database
support(items(itemsets), Income)



