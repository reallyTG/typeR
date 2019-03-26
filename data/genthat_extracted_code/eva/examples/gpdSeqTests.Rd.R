library(eva)


### Name: gpdSeqTests
### Title: GPD Multiple Threshold Goodness-of-Fit Testing
### Aliases: gpdSeqTests

### ** Examples

set.seed(7)
x <- rgpd(10000, loc = 0, scale = 5, shape = 0.2)
## A vector of thresholds to test
threshes <- c(1.5, 2.5, 3.5, 4.5, 5.5)
gpdSeqTests(x, thresholds = threshes, method = "ad")



