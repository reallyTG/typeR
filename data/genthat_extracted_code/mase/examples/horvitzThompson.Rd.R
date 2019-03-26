library(mase)


### Name: horvitzThompson
### Title: Compute the Horvitz-Thompson Estimator
### Aliases: horvitzThompson

### ** Examples

library(survey)
data(api)
horvitzThompson(y = apisrs$api00, pi = apisrs$pw^(-1))
horvitzThompson(y = apisrs$api00, pi = apisrs$pw^(-1), var_est = TRUE, var_method = "lin_HTSRS")




