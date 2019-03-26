library(ICtest)


### Name: plot.ladle
### Title: Plotting an Object of Class ladle
### Aliases: plot.ladle
### Keywords: hplot

### ** Examples

n <- 1000
X <- cbind(rexp(n), rt(n,5), rnorm(n), rnorm(n), rnorm(n), rnorm(n))
test <- FOBIladle(X)
plot(test)



