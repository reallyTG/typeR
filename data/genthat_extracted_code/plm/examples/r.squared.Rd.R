library(plm)


### Name: r.squared
### Title: R squared and adjusted R squared for panel models
### Aliases: r.squared
### Keywords: htest

### ** Examples

data("Grunfeld", package = "plm")
p <- plm(inv ~ value + capital, data = Grunfeld, model = "pooling")
r.squared(p)
r.squared(p, dfcor = TRUE)



