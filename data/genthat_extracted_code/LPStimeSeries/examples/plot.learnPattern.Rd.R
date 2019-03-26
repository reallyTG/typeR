library(LPStimeSeries)


### Name: plot.learnPattern
### Title: Plot method for learnPattern objects
### Aliases: plot.learnPattern
### Keywords: regression tree

### ** Examples

data(GunPoint)
ensemble=learnPattern(GunPoint$trainseries,oob.pred=TRUE,replace=TRUE)
plot(ensemble)



