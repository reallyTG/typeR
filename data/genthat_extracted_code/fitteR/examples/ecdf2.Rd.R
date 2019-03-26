library(fitteR)


### Name: ecdf2
### Title: Calculate cumulative density
### Aliases: ecdf2

### ** Examples

x <- rnorm(1000)
e <- ecdf2(x)
str(e)
plot(e)
plot(e$x, e$cs)

x <- sample(1:100, 1000, replace=TRUE)
plot(ecdf2(x))
tab <- table(x)
x <- unique(x)
lines(ecdf2(x, y=tab), col="green")



