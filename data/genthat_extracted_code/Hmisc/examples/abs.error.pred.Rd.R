library(Hmisc)


### Name: abs.error.pred
### Title: Indexes of Absolute Prediction Error for Linear Models
### Aliases: abs.error.pred print.abs.error.pred
### Keywords: robust regression models

### ** Examples

set.seed(1)         # so can regenerate results
x1 <- rnorm(100)
x2 <- rnorm(100)
y  <- exp(x1+x2+rnorm(100))
f <- lm(log(y) ~ x1 + poly(x2,3), y=TRUE)
abs.error.pred(lp=exp(fitted(f)), y=y)
rm(x1,x2,y,f)



