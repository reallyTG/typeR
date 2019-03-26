library(ICtest)


### Name: summary.ladle
### Title: Summarizing an Object of Class ladle
### Aliases: summary.ladle
### Keywords: methods print

### ** Examples

n <- 1000
X <- cbind(rexp(n), rt(n,5), rnorm(n), rnorm(n), rnorm(n), rnorm(n))

test <- FOBIladle(X)
summary(test)



