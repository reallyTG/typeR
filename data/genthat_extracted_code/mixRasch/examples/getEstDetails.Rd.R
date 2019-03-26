library(mixRasch)


### Name: getEstDetails
### Title: Convenience function returning information about the estimation.
### Aliases: getEstDetails
### Keywords: misc

### ** Examples


# Example data included with mixRasch
data(SimMix)

test1 <- mixRasch(SimMix,1,50, conv.crit=.0001, n.c=1)
getEstDetails(test1)




