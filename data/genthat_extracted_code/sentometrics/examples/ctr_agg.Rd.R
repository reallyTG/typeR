library(sentometrics)


### Name: ctr_agg
### Title: Set up control for aggregation into sentiment measures
### Aliases: ctr_agg

### ** Examples

set.seed(505)

# simple control function
ctr1 <- ctr_agg(howTime = "linear", by = "year", lag = 3)

# more elaborate control function (particular attention to time weighting schemes)
ctr2 <- ctr_agg(howWithin = "proportionalPol",
                howDocs = "proportional",
                howTime = c("equal_weight", "linear", "almon", "beta", "exponential", "own"),
                do.ignoreZeros = TRUE,
                by = "day",
                lag = 20,
                ordersAlm = 1:3,
                do.inverseAlm = TRUE,
                alphasExp = c(0.20, 0.50, 0.70, 0.95),
                aBeta = c(1, 3),
                bBeta = c(1, 3, 4, 7),
                weights = data.frame(myWeights = runif(20)))

# set up control function with one linear and two chosen Almon weighting schemes
a <- weights_almon(n = 70, orders = 1:3, do.inverse = TRUE, do.normalize = TRUE)
ctr3 <- ctr_agg(howTime = c("linear", "own"), by = "year", lag = 70,
                weights = data.frame(a1 = a[, 1], a2 = a[, 3]))




