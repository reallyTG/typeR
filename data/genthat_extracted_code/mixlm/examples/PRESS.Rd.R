library(mixlm)


### Name: PRESS
### Title: Prediction fits
### Aliases: PRESS PRESS.res PRESS.pred R2pred RMSEP rmsep
### Keywords: Regression

### ** Examples

data <- data.frame(y = rnorm(8),
				   x = factor(c('a','a','a','a','b','b','b','b')),
				   z = factor(c('a','a','b','b','a','a','b','b')))
mod <- lm(y ~ x + z, data=data)
RMSEP(mod)
rmsep(mod) # Alias to distinguish it from pls::RMSEP
R2pred(mod)
PRESS(mod)
PRESS.res(mod)
PRESS.pred(mod)



