library(kdist)


### Name: weilines
### Title: Add Lines onto a Weibull Plot
### Aliases: weilines

### ** Examples


dummy <- c(0,0)
weiplot(dummy, xlim = c(1e-3, 10), type = "n")
x <- 10^seq(-3, 2, length = 100)
weilines(x, pexp(x), col = "red")
weilines(x, pweibull(x, 2), col = "blue")
weilines(x, pweibull(x, 3), col = "green")



