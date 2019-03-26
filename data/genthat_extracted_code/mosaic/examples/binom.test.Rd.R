library(mosaic)


### Name: binom.test
### Title: Exact Tests for Proportions
### Aliases: binom.test
### Keywords: stats

### ** Examples

# Several ways to get a confidence interval for the proportion of Old Faithful
# eruptions lasting more than 3 minutes.
data(faithful)
binom.test(faithful$eruptions > 3)
binom.test(97, 272)
binom.test(c(97, 272-97))
faithful$long <- faithful$eruptions > 3
binom.test(faithful$long)
binom.test(resample(1:4, 400), p=.25)
binom.test(~ long, data = faithful)
binom.test(~ long, data = faithful, ci.method = "Wald")
binom.test(~ long, data = faithful, ci.method = "Plus4")
with(faithful, binom.test(~long))
with(faithful, binom.test(long))




