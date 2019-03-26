library(SCEPtERbinary)


### Name: sampleBinStar
### Title: Sample a set of binary systems out of a grid
### Aliases: sampleBinStar
### Keywords: manip

### ** Examples

require(SCEPtER)
data(stdGrid)

bl <- block(stdGrid)
sam <- sampleBinStar(10, stdGrid, bl, restrict=TRUE)



