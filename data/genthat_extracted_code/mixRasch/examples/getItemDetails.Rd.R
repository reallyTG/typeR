library(mixRasch)


### Name: getItemDetails
### Title: Convenience function returning information about an individual
###   item.
### Aliases: getItemDetails
### Keywords: misc

### ** Examples


# Example data included with mixRasch
data(SimMix)

test1 <- mixRasch(SimMix,1,50, conv.crit=.0001, n.c=1)
getItemDetails(test1,2)




