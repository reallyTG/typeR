library(bayeslm)


### Name: summary.bayeslm.fit
### Title: Summarize fitted object of 'bayeslm'
### Aliases: summary.bayeslm.fit
### Keywords: summary

### ** Examples

x = matrix(rnorm(1000), 100, 10)
y = x %*% rnorm(10) + rnorm(100)
fit=bayeslm(y~x)
summary(fit)



