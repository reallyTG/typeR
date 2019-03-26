library(mogavs)


### Name: mogavsToLinear
### Title: Transform a mogavs model into a linear model.
### Aliases: mogavsToLinear
### Keywords: models regression

### ** Examples

data(sampleData)
mod<-mogavs(y~.,sampleData,maxGenerations=20)

#get the best model with 15 variables
bm<-getBestModel(mod,15,method=NULL)

#transform best model into a linear model
mogavsToLinear(bm,1,sampleData)



