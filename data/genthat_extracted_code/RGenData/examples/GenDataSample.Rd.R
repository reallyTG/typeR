library(RGenData)


### Name: GenDataSample
### Title: GenDataSample
### Aliases: GenDataSample

### ** Examples

# create data matrix x with n = 200 cases, k = 9 variables
# 3 variables load onto each of 3 orthogonal factors
# all marginal distributions are highly skewed
x <- matrix(nrow = 200, ncol = 9)
for (i in 1:3) {
  shared <- rchisq(200, 1)
  for (j in 1:3) {
    x[, (i - 1) * 3 + j] <- shared + rchisq(200, 1)
  }
}
# generate sample of data reproducing distributions and correlations in x
GenDataSample(x)



