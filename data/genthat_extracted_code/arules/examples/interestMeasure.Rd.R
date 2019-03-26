library(arules)


### Name: interestMeasure
### Title: Calculate Additional Interest Measures
### Aliases: interestMeasure interestMeasure,rules-method
###   interestMeasure,itemsets-method
### Keywords: models

### ** Examples

data("Income")
rules <- apriori(Income)

## calculate a single measure and add it to the quality slot
quality(rules) <- cbind(quality(rules), 
	hyperConfidence = interestMeasure(rules, measure = "hyperConfidence", 
	transactions = Income))

inspect(head(rules, by = "hyperConfidence"))

## calculate several measures
m <- interestMeasure(rules, c("confidence", "oddsRatio", "leverage"), 
	transactions = Income)
inspect(head(rules))
head(m)

## calculate all available measures for the first 5 rules and show them as a 
## table with the measures as rows
t(interestMeasure(head(rules, 5), transactions = Income))

## calculate measures on a differnt set of transactions (I use a sample here)
## Note: reuse = TRUE (default) would just return the stored support on the
##	data set used for mining
newTrans <- sample(Income, 100)
m2 <- interestMeasure(rules, "support", transactions = newTrans, reuse = FALSE) 
head(m2)



