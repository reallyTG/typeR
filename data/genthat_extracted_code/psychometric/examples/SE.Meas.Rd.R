library(psychometric)


### Name: SE.Meas
### Title: Standard Errors of Measurement (test scores)
### Aliases: SE.Meas SE.Est SE.Pred
### Keywords: htest distribution

### ** Examples

# Examples from Dudek (1979)
# Suppose a test has mean = 500, SD = 100 rxx = .9
# If an individual scores 700 on the test
# The three SE are:
SE.Meas (100, .9)
SE.Est (100, .9)
SE.Pred (100, 9)

# CI about the true score
CI.tscore(700, 500, 100, .9)

# CI about the observed score
CI.obs(700, 100, .9)




