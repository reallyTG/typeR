library(randtests)


### Name: rank.test
### Title: Mann-Kendall Rank Test
### Aliases: rank.test
### Keywords: randomness test

### ** Examples

##
## Example 1
## Sweet potato yield per acre, 1868-1937 in the United States.
## Available in this package.
##
data(sweetpotato)
rank.test(sweetpotato$yield)

##
## Example 2
## Old Faithful Geyser Data on Eruption time in mins.
## Available in R package datasets.
##
rank.test(faithful$eruptions)



