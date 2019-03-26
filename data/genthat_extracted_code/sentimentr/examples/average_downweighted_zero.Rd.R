library(sentimentr)


### Name: average_downweighted_zero
### Title: Downweighted Zeros Averaging
### Aliases: average_downweighted_zero average_weighted_mixed_sentiment
###   average_mean

### ** Examples

x <- c(1, 2, 0, 0, 0, -1)
mean(x)
average_downweighted_zero(x)
average_downweighted_zero(c(NA, x))
mean(c(0, 0, 0, x))
average_downweighted_zero(c(0, 0, 0, x))



