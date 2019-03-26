library(timeordered)


### Name: generatetonetwork
### Title: Generates a time-ordered network from an interaction list.
### Aliases: generatetonetwork
### Keywords: ~kwd1 ~kwd2

### ** Examples

data(ants)
allindivs <- c(union(ants$VertexFrom, ants$VertexTo), "NULL1", "NULL2")
g <- generatetonetwork(ants, allindivs)
plottonet(g)



