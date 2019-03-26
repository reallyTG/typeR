library(sdols)


### Name: plot.sdols.confidence
### Title: Confidence and Exemplar Plotting
### Aliases: plot.sdols.confidence

### ** Examples

## No test: 

probabilities <- expectedPairwiseAllocationMatrix(iris.clusterings)
clustering <- salso(probabilities)
conf <- confidence(clustering,probabilities)
plot(conf)
plot(conf,data=iris)

## Don't show: 
rscala::scalaDisconnect(sdols:::s)
## End(Don't show)
## End(No test)




