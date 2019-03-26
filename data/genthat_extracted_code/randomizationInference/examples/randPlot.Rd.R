library(randomizationInference)


### Name: randPlot
### Title: Randomization-Based Plot
### Aliases: randPlot
### Keywords: methods

### ** Examples

## Completely randomized design example
## with one treatment factor at two levels
w = c(rep(0,5), rep(1,5))
y = rnorm(10, mean = 0, sd = 1)
## Two-sided test
twoSidedTest = randTest(y, w, nrand = 50, calcTestStat = diffMeans)
randPlot(twoSidedTest)

## Reading comprehension pre- and post-test example
data(reading)
## Testing within-block pairwise effects
readingTest=randTest(y = reading$Diff1, w = reading$Group, nrand = 50,
    calcTestStat = withinBlockEffects,
    calcOptions = list(block = reading$Block,
        pairs = rbind(c("Basal", "DRTA"), c("Basal", "Strat"),
            c("DRTA", "Strat"), c("Basal", "DRTA"),
            c("Basal", "Strat"), c("DRTA", "Strat")),
        blockindex = c(rep(1,3), rep(2,3))),
    randOptions = list(type = "block", block = reading$Block))
randPlot(readingTest, breaks = 20, plotDim = c(2,3))



