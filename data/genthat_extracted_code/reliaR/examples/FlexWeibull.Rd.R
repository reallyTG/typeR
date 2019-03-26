library(reliaR)


### Name: FlexWeibull
### Title: The flexible Weibull(FW) distribution
### Aliases: FlexWeibull dflex.weibull pflex.weibull qflex.weibull
###   rflex.weibull
### Keywords: distribution

### ** Examples

## Load data sets
data(repairtimes)
## Maximum Likelihood(ML) Estimates of alpha & beta for the data(repairtimes)
## Estimates of alpha & beta using 'maxLik' package
## alpha.est = 0.07077507, beta.est = 1.13181535

dflex.weibull(repairtimes, 0.07077507, 1.13181535, log = FALSE)
pflex.weibull(repairtimes, 0.07077507, 1.13181535, lower.tail = TRUE, log.p = FALSE)
qflex.weibull(0.25, 0.07077507, 1.13181535, lower.tail=TRUE, log.p = FALSE)
rflex.weibull(30, 0.07077507, 1.13181535)



