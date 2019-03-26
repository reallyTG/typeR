library(mase)


### Name: greg
### Title: Compute a generalized regression estimator
### Aliases: greg

### ** Examples

library(survey)
data(api)
greg(y = apisrs$api00, x_sample = apisrs[c("col.grad", "awards")], 
x_pop = apipop[c("col.grad", "awards")], pi = apisrs$pw^(-1), 
var_est = TRUE)

#To estimate a proportion
y <- 0 + (apisrs$both == "Yes")
greg(y = y, x_sample = apisrs[c("col.grad")], 
x_pop = apipop[c("col.grad")], pi = apisrs$pw^(-1), 
var_est = TRUE, model = "logistic")




