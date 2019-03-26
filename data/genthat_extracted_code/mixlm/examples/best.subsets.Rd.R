library(mixlm)


### Name: best.subsets
### Title: F-test based best subset selection.
### Aliases: best.subsets
### Keywords: regression

### ** Examples

data <- data.frame(y = rnorm(8),
				   x = factor(c('a','a','a','a','b','b','b','b')),
				   z = factor(c('a','a','b','b','a','a','b','b')))
mod <- lm(y ~ x + z, data=data)
best.subsets(mod)



