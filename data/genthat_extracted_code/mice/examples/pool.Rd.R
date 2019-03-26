library(mice)


### Name: pool
### Title: Combine estimates by Rubin's rules
### Aliases: pool
### Keywords: htest

### ** Examples

# pool using the classic MICE workflow
imp <- mice(nhanes, maxit = 2, m = 2)
fit <- with(data = imp, exp = lm(bmi ~ hyp + chl))
summary(pool(fit))



