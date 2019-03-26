library(mase)


### Name: gregElasticNet
### Title: Compute an elastic net regression estimator
### Aliases: gregElasticNet

### ** Examples

library(survey)
data(api)
gregElasticNet(y = apisrs$api00, 
x_sample = apisrs[c("col.grad", "awards", "snum", "dnum", "cnum", "pcttest", "meals", "sch.wide")], 
x_pop = apipop[c("col.grad", "awards", "snum", "dnum", "cnum", "pcttest", "meals", "sch.wide")], 
pi = apisrs$pw^(-1), var_est = TRUE, alpha = .5)




