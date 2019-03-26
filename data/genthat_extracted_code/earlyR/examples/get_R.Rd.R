library(earlyR)


### Name: get_R
### Title: Estimate the Reproduction Number
### Aliases: get_R get_R.default get_R.integer get_R.numeric
###   get_R.incidence

### ** Examples


if (require(incidence)) {

## example: onsets on days 1, 5, 6 and 12; estimation on day 24
 x <- incidence(c(1, 5, 6, 12), last_date = 24)
 x
 as.data.frame(x)
 plot(x)
 res <- get_R(x, disease = "ebola")
 res
 plot(res)
 plot(res, "lambdas")

}




