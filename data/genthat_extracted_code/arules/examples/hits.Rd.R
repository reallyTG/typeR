library(arules)


### Name: hits
### Title: Computing Transaction Weights With HITS
### Aliases: hits
### Keywords: models

### ** Examples

data(SunBai)

## calculate transaction weigths  
w <- hits(SunBai)
w

## add transaction weight to the dataset
transactionInfo(SunBai)[["weight"]] <- w
transactionInfo(SunBai)

## calulate regular item frequencies
itemFrequency(SunBai, weighted = FALSE)

## calulate weighted item frequencies
itemFrequency(SunBai, weighted = TRUE)



