library(RecordLinkage)


### Name: getPairs
### Title: Extract Record Pairs
### Aliases: getPairs getPairs,RecLinkData-method
###   getPairs,RecLinkResult-method getPairs-methods
###   getPairs,RLResult-method getPairs,RLBigData-method getFalsePos
###   getFalseNeg getFalse
### Keywords: classif

### ** Examples

data(RLdata500)

# create record pairs and calculate epilink weights
rpairs <- RLBigDataDedup(RLdata500, identity = identity.RLdata500,
  blockfld=list(1,3,5,6,7))
rpairs <- epiWeights(rpairs)

# show all record pairs with weights between 0.5 and 0.6
getPairs(rpairs, min.weight=0.5, max.weight=0.6)

# show only matches with weight <= 0.5
getPairs(rpairs, max.weight=0.5, filter.match="match")

# classify with one threshold
result <- epiClassify(rpairs, 0.5)

# show all links, do not show classification in the output
getPairs(result, filter.link="link", withClass = FALSE)

# see wrongly classified pairs
getFalsePos(result)
getFalseNeg(result)



