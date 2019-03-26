library(sampSurf)


### Name: sampleTrees
### Title: Generates a Synthetic Population of Standing Tree Attributes
### Aliases: sampleTrees
### Keywords: ~kwd1 ~kwd2

### ** Examples

#
#  draw from a unit square (metric default)...
#
sampleTrees(species=c('ewp','sm','978'),dbhs=c(4,10), heights=c(3,6))
#
# draw from a buffer...
#
bufftr = bufferedTract(10, Tract(c(x=50,y=50),cellSize=0.5))
st = sampleTrees(10, sampleRect=bufftr@bufferRect, dbhs=c(20,40))
strees = standingTrees(st)
plot(bufftr, axes=TRUE, gridColor='grey80')
plot(strees, add=TRUE)



