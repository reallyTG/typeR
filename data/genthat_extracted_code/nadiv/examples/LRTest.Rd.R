library(nadiv)


### Name: LRTest
### Title: log-Likelihood Ratio Test
### Aliases: LRTest

### ** Examples


# No boundary correction
(noBC <- LRTest(full = -2254.148, reduced = -2258.210,
	df = 1, boundaryCorrection = FALSE))
# No boundary correction
(withBC <- LRTest(full = -2254.148, reduced = -2258.210,
	df = 1, boundaryCorrection = TRUE))
stopifnot(noBC$Pval == 2*withBC$Pval)




