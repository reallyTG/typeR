library(splinetree)


### Name: spaghettiPlot
### Title: Create a faceted spaghetti plot of a splinetree model
### Aliases: spaghettiPlot

### ** Examples

## No test: 
nlsySubset <- nlsySample[nlsySample$ID %in% sample(unique(nlsySample$ID), 400),]
split_formula <- ~HISP + WHITE + BLACK + SEX + Num_sibs + HGC_FATHER + HGC_MOTHER
tree <- splineTree(split_formula, BMI~AGE, idvar = "ID",
   data = nlsySubset, degree = 1, df = 3,
   intercept = TRUE, cp = 0.005)
## End(No test)
spaghettiPlot(tree)



