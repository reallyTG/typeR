library(ICtest)


### Name: print.ladle
### Title: Printing an Object of Class ladle
### Aliases: print.ladle
### Keywords: methods print

### ** Examples

n <- 1000
X <- cbind(rexp(n), rt(n,5), rnorm(n), rnorm(n), rnorm(n), rnorm(n))
test <- FOBIladle(X)
test



