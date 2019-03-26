library(mgcViz)


### Name: listLayers
### Title: Lists available layers for plotSmooth objects
### Aliases: listLayers

### ** Examples

library(mgcViz)
n  <- 400
x1 <- rnorm(n)
x2 <- rnorm(n)
dat <- data.frame("x1" = x1, "x2" = x2,
                  "y" = sin(x1) + 0.5 * x2^2 + rnorm(n))
b <- gam(y ~ x1+s(x2), data = dat, method = "REML")
b <- getViz(b)

# List layers available for parametric effect plot
o <- plot( pterm(b, 1) )
listLayers(o)

# List layers available for smooth effect plot
o <- plot( sm(b, 1) )
listLayers(o)

# List layers available for checking plot
o <- check1D(b, x1)
listLayers(o)




