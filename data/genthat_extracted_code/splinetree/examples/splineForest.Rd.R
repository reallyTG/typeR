library(splinetree)


### Name: splineForest
### Title: Build a splineforest object.
### Aliases: splineForest

### ** Examples

## No test: 
nlsySubset <- nlsySample[nlsySample$ID %in% sample(unique(nlsySample$ID), 400),]
splitForm <-~HISP+WHITE+BLACK+HGC_MOTHER+HGC_FATHER+SEX+Num_sibs
sampleForest <- splineForest(splitForm, BMI~AGE, 'ID', nlsySubset, degree=1, cp=0.005, ntree=10)
## End(No test)



