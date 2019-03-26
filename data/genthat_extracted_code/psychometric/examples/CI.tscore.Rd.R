library(psychometric)


### Name: CI.tscore
### Title: Confidence Intervals for Test Scores
### Aliases: CI.tscore CI.obs
### Keywords: models htest

### ** Examples

# Examples from Dudek (1979)
# Suppose a test has mean = 500, SD = 100 rxx = .9
# If an individual scores 700 on the test
CI.tscore (700, 500, 100, .9, level=.68)
CI.obs(700, 100,.9, level=.68)



