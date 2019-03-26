library(nima)


### Name: compFun
### Title: Compare Two Similar Objects including Missing Data Patterns.
### Aliases: compFun

### ** Examples

x <- c(5, 8, 9, NA, 3, NA)
y <- c(5, 2, 9, 4, NA, NA)
compFun(x,y)

x <- matrix(rnorm(1000), ncol = 20)
x[sample(seq(along = x), 100)] <- NA
all(compFun(x,x))
dim(compFun(x,x))

x <- as.list(c(5, 8, 9, NA, 3, NA))
y <- as.list(y)
sapply(compFun(x,y), function(a) sum(!a))

x <- as.data.frame(x)
y <- as.data.frame(y)
sum(!compFun(x,y))



