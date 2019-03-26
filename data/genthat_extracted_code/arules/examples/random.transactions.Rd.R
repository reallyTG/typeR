library(arules)


### Name: random.transactions
### Title: Simulate a Random Transaction Data Set
### Aliases: random.transactions random.patterns
### Keywords: datagen

### ** Examples

## generate random 1000 transactions for 200 items with 
## a success probability decreasing from 0.2 to 0.0001
## using the method described in Hahsler et al. (2006).
trans <- random.transactions(nItems = 200, nTrans = 1000, 
   lambda = 5, iProb = seq(0.2,0.0001, length=200))

## size distribution
summary(size(trans))

## display random data set
image(trans)

## use the method by Agrawal and Srikant (1994) to simulate transactions 
## which contains correlated items. This should create data similar to
## T10I4D100K (we just create 100 transactions here to speed things up).
patterns <- random.patterns(nItems = 1000)
summary(patterns)

trans2 <- random.transactions(nItems = 1000, nTrans = 100, 
   method = "agrawal", patterns = patterns)
image(trans2) 

## plot data with items ordered by item frequency
image(trans2[,order(itemFrequency(trans2), decreasing=TRUE)])



