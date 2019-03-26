library(rockchalk)


### Name: formatSummarizedFactors
### Title: Prints out the contents of an object created by summarizeFactors
###   in the style of base::summary
### Aliases: formatSummarizedFactors

### ** Examples

dat <- data.frame(xcat1 = gl(10, 3), xcat2 = gl(5, 6))
summarizeFactors(dat, maxLevels = 8)
formatSummarizedFactors(summarizeFactors(dat))



