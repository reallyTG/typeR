library(LPStimeSeries)


### Name: plotMDS
### Title: Multi-dimensional Scaling Plot of Learned Pattern Similarity
### Aliases: plotMDS
### Keywords: similarity

### ** Examples

set.seed(1)
data(GunPoint)
## Learn patterns on GunPoint training series with default parameters
ensemble=learnPattern(GunPoint$trainseries)
plotMDS(ensemble, GunPoint$trainseries,GunPoint$trainclass)

## Using different symbols for the classes:
plotMDS(ensemble, GunPoint$trainseries,GunPoint$trainclass, 
         palette=rep(1, 2), pch=as.numeric(GunPoint$trainclass))
         
## Learn patterns on GunPoint training series with random splits
ensemble=learnPattern(GunPoint$trainseries,random.split=1)
plotMDS(ensemble, GunPoint$trainseries,GunPoint$trainclass,main='Random Splits')




