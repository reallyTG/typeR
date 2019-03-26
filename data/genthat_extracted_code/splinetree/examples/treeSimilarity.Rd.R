library(splinetree)


### Name: treeSimilarity
### Title: Returns a measure of how similar the two trees are.
### Aliases: treeSimilarity

### ** Examples

## No test: 
splitForm <- ~SEX+Num_sibs+HGC_MOTHER+HGC_FATHER
nlsySubset <- nlsySample[nlsySample$ID %in% sample(unique(nlsySample$ID), 400),]
tree1 <- splineTree(splitForm, BMI~AGE, "ID", nlsySubset, degree=1, df=2, intercept=FALSE, cp=0.005)
tree2 <- splineTree(splitForm, BMI~AGE, "ID", nlsySubset, degree=1, df=3, intercept=TRUE, cp=0.005)
treeSimilarity(tree1, tree2)
## End(No test)



