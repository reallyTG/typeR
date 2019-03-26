library(sandwich)


### Name: bread
### Title: Bread for Sandwiches
### Aliases: bread bread.default bread.lm bread.mlm bread.survreg
###   bread.coxph bread.gam bread.nls bread.rlm bread.hurdle bread.zeroinfl
###   bread.mlogit bread.polr bread.clm
### Keywords: regression

### ** Examples

## linear regression
x <- sin(1:10)
y <- rnorm(10)
fm <- lm(y ~ x)

## bread: n * (x'x)^{-1}
bread(fm)
solve(crossprod(cbind(1, x))) * 10



