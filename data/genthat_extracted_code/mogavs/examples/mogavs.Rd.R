library(mogavs)


### Name: mogavs
### Title: Multiobjective Genetic Algorithm for Variable Selection
### Aliases: mogavs mogavs.formula mogavs.default
### Keywords: models regression

### ** Examples

data(sampleData)
#just a few generations to keep test fast
mogavs(y~.,data=sampleData,maxGenerations=5)

#with a more sensible number of generations, with all plotting on
## Not run: mogavs(y~.,data=sampleData,maxGenerations=100,plots=TRUE,additionalPlots=TRUE)




