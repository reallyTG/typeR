library(extremefit)


### Name: wecdf
### Title: Weighted empirical cumulative distribution function
### Aliases: wecdf

### ** Examples


X <- rpareto(10)
x <- seq(0.8, 50, 0.01)
plot(x, wecdf(X, x, rep(1,length(X))))

#to compare with the ecdf function
f <- ecdf(X)
lines(x, f(x), col = "red", type = "s")




