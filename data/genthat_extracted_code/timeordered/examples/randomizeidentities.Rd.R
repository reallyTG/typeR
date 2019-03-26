library(timeordered)


### Name: randomizeidentities
### Title: Resamples data based on vertex identity.
### Aliases: randomizeidentities
### Keywords: ~kwd1 ~kwd2

### ** Examples

data(ants)
allindivs <- c(union(ants$VertexFrom, ants$VertexTo), "NULL1", "NULL2")
ri <- randomizeidentities(ants,withinvertexfrom=TRUE,byvertexfrom=TRUE,withreplacement=TRUE)
g <- generatetonetwork(ri, allindivs)
plottonet(g)




