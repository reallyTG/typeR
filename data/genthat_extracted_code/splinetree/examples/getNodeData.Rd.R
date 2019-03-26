library(splinetree)


### Name: getNodeData
### Title: Retrieve the subset of the data found at a given terminal node
### Aliases: getNodeData

### ** Examples

## Not run: 
##D split_formula <- BMI ~ HISP + WHITE + BLACK + SEX +
##D   Num_sibs + HGC_FATHER + HGC_MOTHER
##D tree <- splineTree(split_formula, BMI~AGE, 'ID', nlsySample, degree=1,
##D   df=3, intercept=TRUE, cp=0.006, minNodeSize=20)
## End(Not run)
node6data <- getNodeData(tree, 6, dataType = 'all')
plot(BMI~AGE, data=node6data)



