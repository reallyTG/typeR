library(arules)


### Name: abbreviate
### Title: Abbreviate function for item labels in transactions, itemMatrix
###   and associations
### Aliases: abbreviate abbreviate,transactions-method
###   abbreviate,rules-method abbreviate,itemsets-method
###   abbreviate,itemMatrix-method abbreviate,tidLists-method
### Keywords: manip

### ** Examples

data(Adult)
inspect(head(Adult, 1))

Adult_abbr <- abbreviate(Adult, 15)
inspect(head(Adult_abbr, 1))



