library(splinetree)


### Name: yR2
### Title: Computes percent of variation in response explained by spline
###   tree.
### Aliases: yR2

### ** Examples

## No test: 
split_formula <- ~HISP + WHITE + BLACK + SEX + Num_sibs + HGC_FATHER + HGC_MOTHER
tree <- splineTree(split_formula, BMI~AGE, idvar = "ID",
   data = nlsySample, degree = 1, df = 3,
   intercept = TRUE, cp = 0.005)
## End(No test)
yR2(tree)



