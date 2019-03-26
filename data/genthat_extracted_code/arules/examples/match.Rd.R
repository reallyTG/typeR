library(arules)


### Name: match
### Title: Value Matching
### Aliases: match %in% %in%,itemsets,itemsets-method
###   %in%,itemsets,character-method %pin% %oin% %ain%
###   match,itemsets,itemsets-method match,rules,rules-method
###   match,itemMatrix,itemMatrix-method
### Keywords: manip

### ** Examples

data("Adult")

## get unique transactions, count frequency of unique transactions 
## and plot frequency of unique transactions
vals <- unique(Adult)
cnts <- tabulate(match(Adult, vals))
plot(sort(cnts, decreasing=TRUE))

## find all transactions which are equal to transaction 10 in Adult
which(Adult %in% Adult[10])

## for transactions we can also match directly with itemLabels.
## Find in the first 10 transactions the ones which 
## contain age=Middle-aged (see help page for class itemMatrix)
Adult[1:10] %in% "age=Middle-aged"

## find all transactions which contain items that partially match "age=" (all here).
Adult[1:10] %pin% "age="

## find all transactions that only include the item "age=Middle-aged" (none here).
Adult[1:10] %oin% "age=Middle-aged"

## find al transaction which contain both items "age=Middle-aged" and "sex=Male"
Adult[1:10] %ain% c("age=Middle-aged", "sex=Male")



