library(DynTxRegime)


### Name: .newTxInfoNoSubsets
### Title: Create Treatment Information Object When Subsets are not
###   Identified
### Aliases: .newTxInfoNoSubsets
###   .newTxInfoNoSubsets,character,factor-method
###   .newTxInfoNoSubsets,character,integer-method
### Keywords: internal

### ** Examples


# Integer treatment 
txVec <- rbinom(100,1,0.5)
txName <- "A1"

tst <- DynTxRegime:::.newTxInfoNoSubsets(txName = txName, 
                                         txVec = txVec,  
                                         suppress = FALSE)

is(tst)

# Factor treatment
txVec <- as.factor(txVec)

tst <- DynTxRegime:::.newTxInfoNoSubsets(txName = txName,  
                                         txVec = txVec,  
                                         suppress = FALSE)

is(tst)




