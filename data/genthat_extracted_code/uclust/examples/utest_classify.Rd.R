library(uclust)


### Name: utest_classify
### Title: Test for classification of a sample in one of two groups.
### Aliases: utest_classify

### ** Examples

# Example 1
# Five observations from each group, G1 and G2. Each observation has 60 dimensions.
data <- matrix(c(rnorm(300, 0), rnorm(300, 10)), ncol = 60, byrow=TRUE)
# Test data comes from G1.
x <- rnorm(60, 0)
# The test correctly indicates that the test data should be classified into G1 (p < 0.05).
utest_classify(x, data, group_id = c(rep(0,times=5),rep(1,times=5)))

# Example 2
# Five observations from each group, G1 and G2. Each observation has 60 dimensions.
data <- matrix(c(rnorm(300, 0), rnorm(300, 10)), ncol = 60, byrow=TRUE)
# Test data comes from G2.
x <- rnorm(60, 10)
# The test correctly indicates that the test data should be classified into G2 (p > 0.05).
utest_classify(x, data, group_id = c(rep(1,times=5),rep(0,times=5)))



