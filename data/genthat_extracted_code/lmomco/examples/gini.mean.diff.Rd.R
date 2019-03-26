library(lmomco)


### Name: gini.mean.diff
### Title: Gini Mean Difference Statistic
### Aliases: gini.mean.diff
### Keywords: special function

### ** Examples

fake.dat <- c(123,34,4,654,37,78)
gini <- gini.mean.diff(fake.dat)
lmr <- lmoms(fake.dat)
str(gini)
print(abs(gini$L2 - lmr$lambdas[2]))



