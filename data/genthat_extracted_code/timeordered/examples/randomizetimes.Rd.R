library(timeordered)


### Name: randomizetimes
### Title: Resamples data based on event time.
### Aliases: randomizetimes
### Keywords: ~kwd1 ~kwd2

### ** Examples

data(ants)
allindivs <- c(union(ants$VertexFrom, ants$VertexTo), "NULL1", "NULL2")
rt <- randomizetimes(ants,withinvertexfrom=TRUE,byvertexfrom=TRUE,withreplacement=TRUE)
g <- generatetonetwork(rt, allindivs)
plottonet(g)





