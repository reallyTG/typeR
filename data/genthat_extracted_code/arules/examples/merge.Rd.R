library(arules)


### Name: merge
### Title: Adding Items to Data
### Aliases: merge merge,itemMatrix-method merge,transactions-method
### Keywords: manip

### ** Examples

data("Groceries")

## create a random item as a matrix
randomItem <- sample(c(TRUE, FALSE), size=length(Groceries),replace=TRUE)
randomItem <- as.matrix(randomItem)
colnames(randomItem) <- "random item"
head(randomItem, 3)

## add the random item to Groceries
g2 <- merge(Groceries, randomItem)
nitems(Groceries)
nitems(g2)
inspect(head(g2,3))



