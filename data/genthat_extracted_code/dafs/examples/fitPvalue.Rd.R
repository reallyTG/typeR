library(dafs)


### Name: fitPvalue
### Title: Return the P-value from an F-test for a linear model
### Aliases: fitPvalue

### ** Examples

x = runif(100,1,10)
y = 2 + 3*x + rnorm(100)
fit = lm(y~x)
fitPvalue(fit)



