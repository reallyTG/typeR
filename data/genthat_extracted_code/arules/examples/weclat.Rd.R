library(arules)


### Name: weclat
### Title: Mining Associations from Weighted Transaction Data with Eclat
###   (WARM)
### Aliases: weclat WARM warm
### Keywords: models

### ** Examples

data(SunBai)
SunBai

## weights are stored in transactionInfo
transactionInfo(SunBai)

## mine weighted support itemsets using transaction support in SunBai
s <- weclat(SunBai, parameter = list(support = 0.3),
		       control = list(verbose = TRUE))
inspect(sort(s))

## create rules using weighted support (satisfying a minimum 
## weighted confidence of 90%).
r <- ruleInduction(s, confidence = .9)
inspect(r)



