library(WeightedPortTest)


### Name: Weighted.Box.test
### Title: Weighted Portmanteau Test
### Aliases: Weighted.Box.test

### ** Examples

set.seed(1)
x <- rnorm(100);
Weighted.Box.test(x, lag=10, type="Ljung");
Weighted.Box.test(x, lag=10, type="Ljung", sqrd.res=TRUE);



