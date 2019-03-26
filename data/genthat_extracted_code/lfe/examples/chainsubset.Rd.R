library(lfe)


### Name: chainsubset
### Title: Chain subset conditions
### Aliases: chainsubset

### ** Examples

set.seed(48)
N <- 10000
dat <- data.frame(y=rnorm(N), x=rnorm(N))
# It's not the same as and'ing the conditions:
felm(y ~ x,data=dat,subset=chainsubset(x < mean(y), y < 2*mean(x)))
felm(y ~ x,data=dat,subset=chainsubset(y < 2*mean(x), x < mean(y)))
felm(y ~ x,data=dat,subset=(x < mean(y)) & (y < 2*mean(x)))
lm(y ~ x, data=dat, subset=chainsubset(x < mean(y), x > mean(y)))



