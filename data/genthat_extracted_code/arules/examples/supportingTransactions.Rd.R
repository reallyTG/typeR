library(arules)


### Name: supportingTransactions
### Title: Supporting Transactions
### Aliases: supportingTransactions
###   supportingTransactions,associations-method
### Keywords: models

### ** Examples

data <- list(
	c("a","b","c"),
	c("a","b"),
	c("a","b","d"),
	c("b","e"),
	c("b","c","e"),
	c("a","d","e"),
	c("a","c"),
	c("a","b","d"),
	c("c","e"),
	c("a","b","d","e")
	)
data <- as(data, "transactions")

## mine itemsets
f <- eclat(data, parameter = list(support = .2, minlen=3))
inspect(f)

## find supporting Transactions
st <- supportingTransactions(f, data)
st

as(st, "list")



