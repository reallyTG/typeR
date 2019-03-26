library(mosaic)


### Name: statTally
### Title: Tally test statistics
### Aliases: statTally
### Keywords: inference

### ** Examples

# is my spinner fair?
x <- c(10, 18, 9, 15)   # counts in four cells
rdata <- rmultinom(999, sum(x), prob = rep(.25, 4))
statTally(x, rdata, fun = max, binwidth = 1)  # unusual test statistic
statTally(x, rdata, fun = var, shade = "red", binwidth = 2)  # equivalent to chi-squared test
# Can also be used with test stats that are precomputed.
if (require(mosaicData)) {
D <- diffmean( age ~ sex, data = HELPrct); D
nullDist <- do(999) * diffmean( age ~ shuffle(sex), data = HELPrct)
statTally(D, nullDist)
statTally(D, nullDist, system = "lattice")
}




