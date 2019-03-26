library(splinetree)


### Name: treeSize
### Title: Returns number of terminal nodes in a tree.
### Aliases: treeSize

### ** Examples

## Not run: 
##D split_formula <- ~ HISP + WHITE + BLACK + SEX + HGC_FATHER + HGC_MOTHER + Num_sibs
##D tree <- splineTree(split_formula, BMI~AGE, 'ID', nlsySample, degree=1,
##D   df=3, intercept=TRUE, cp=0.006, minNodeSize=20)
## End(Not run)
treeSize(tree)



