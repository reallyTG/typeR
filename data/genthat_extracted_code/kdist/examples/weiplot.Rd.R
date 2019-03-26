library(kdist)


### Name: weiplot
### Title: Create Weibull Plot.
### Aliases: weiplot

### ** Examples


graphics::par(mar = c(5, 5, 5, 5))
r <- rexp(100000)
weiplot(r, xlim = c(1e-3, 10))
x <- 10^seq(-3, 2, length = 100)
weilines(x, pexp(x))



