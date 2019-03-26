library(utiml)


### Name: cv
### Title: Multi-label cross-validation
### Aliases: cv

### ** Examples

#Run 10 folds for BR method
res1 <- cv(toyml, br, base.algorithm="RANDOM", cv.folds=10)

#Run 3 folds for RAkEL method and get the fold results
res2 <- cv(mdata=toyml, method="rakel", base.algorithm="RANDOM", k=2, m=10,
 cv.folds=3, cv.results=TRUE)



