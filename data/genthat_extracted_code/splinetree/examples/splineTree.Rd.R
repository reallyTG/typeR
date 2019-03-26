library(splinetree)


### Name: splineTree
### Title: Build a splinetree object
### Aliases: splineTree

### ** Examples

## Don't show: 
  nlsySample_subset <- nlsySample[nlsySample$ID %in% sample(unique(nlsySample$ID), 500),]
## End(Don't show)
splitForm <- ~HISP+WHITE+BLACK+HGC_MOTHER+HGC_FATHER+SEX+Num_sibs
tree1 <- splineTree(splitForm, BMI~AGE, 'ID', nlsySample_subset, degree=3, intercept=TRUE, cp=0.005)
stPrint(tree1)
stPlot(tree1)



