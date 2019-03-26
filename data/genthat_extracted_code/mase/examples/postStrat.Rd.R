library(mase)


### Name: postStrat
### Title: Compute a post-stratified estimator
### Aliases: postStrat

### ** Examples

library(survey)
data(api) 
postStrat(y = apisrs$api00, x_sample = apisrs$awards, 
x_pop = data.frame(table(apipop$awards)), data_type = "totals", 
pi = apisrs$pw^(-1))




