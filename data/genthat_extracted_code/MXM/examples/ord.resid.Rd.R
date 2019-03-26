library(MXM)


### Name: Probability residual of ordinal logistic regreession
### Title: Probability residual of ordinal logistic regreession
### Aliases: ord.resid

### ** Examples

library(MASS)
y <- factor( rbinom(500, 4, 0.6), ordered = TRUE )
x <- rnorm(500)
mod <- MASS::polr(y ~ x) 
res <- ord.resid(y, mod$fitted.values)



