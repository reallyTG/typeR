library(ICtest)


### Name: ladleplot
### Title: Ladle Plot for an Object of Class ladle
### Aliases: ladleplot
### Keywords: hplot

### ** Examples

n <- 1000
X <- cbind(rexp(n), rt(n,5), rnorm(n), rnorm(n), rnorm(n), rnorm(n))
test <- FOBIladle(X)
ladleplot(test)
ladleplot(test, crit="fn")
ladleplot(test, crit="phin")
ladleplot(test, crit="lambda")



