library(timeordered)


### Name: spreadanalysis
### Title: Simulates the perfect spread of a resource on a time-ordered
###   network.
### Aliases: spreadanalysis
### Keywords: ~kwd1 ~kwd2

### ** Examples

data(ants)
allindivs <- c(union(ants$VertexFrom, ants$VertexTo), "NULL1", "NULL2")
g <- generatetonetwork(ants, allindivs)
sa <- spreadanalysis(g, seq(0,1000,by=50), 20)
boxplot(sa[,-1],xlab="Time delay",ylab="Fraction reached")




