library(scan)


### Name: randSC
### Title: Randomization Tests for single-case data
### Aliases: randSC rand.test

### ** Examples

## Compute a randomization test on the first case of the byHeart2011 data and include a graph
randSC(byHeart2011[1], statistic = "Median B-A", graph = TRUE)

## Compute a randomization test on the Grosche2011 data using complete permutation
randSC(Grosche2011, statistic = "Median B-A", complete = TRUE, limit = 4)



