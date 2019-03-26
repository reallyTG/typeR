library(ICtest)


### Name: ggladleplot
### Title: Ladle Plot for an Object of Class ladle Using ggplot2
### Aliases: ggladleplot
### Keywords: hplot

### ** Examples

n <- 1000
X <- cbind(rexp(n), rt(n,5), rnorm(n), rnorm(n), rnorm(n), rnorm(n))
test <- FOBIladle(X)
ggladleplot(test)
ggladleplot(test, crit="fn")
ggladleplot(test, crit="phin")
ggladleplot(test, crit="lambda")



