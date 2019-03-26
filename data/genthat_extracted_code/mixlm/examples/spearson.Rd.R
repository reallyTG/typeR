library(mixlm)


### Name: spearson
### Title: Standardized Pearson residuals
### Aliases: spearson
### Keywords: Regression

### ** Examples

data <- data.frame(y = rnorm(8),
				   x = factor(c('a','a','a','a','b','b','b','b')),
				   z = factor(c('a','a','b','b','a','a','b','b')))
mod <- lm(y ~ x + z, data=data)
spearson(mod)



