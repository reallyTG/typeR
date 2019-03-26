library(mase)


### Name: gregTree
### Title: Compute a regression tree estimator
### Aliases: gregTree

### ** Examples

library(survey)
data(api)
gregTree(y = apisrs$api00, 
x_sample = apisrs[c("col.grad", "awards", "snum", "dnum", "cnum", "pcttest", "meals", "sch.wide")], 
x_pop = apipop[c("col.grad", "awards", "snum", "dnum", "cnum", "pcttest", "meals", "sch.wide")])




