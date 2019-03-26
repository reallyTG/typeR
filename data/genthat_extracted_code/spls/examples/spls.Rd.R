library(spls)


### Name: spls
### Title: Fit SPLS regression models
### Aliases: spls
### Keywords: regression multivariate

### ** Examples

    data(yeast)
    # SPLS with eta=0.7 & 8 hidden components
    (f <- spls(yeast$x, yeast$y, K=8, eta=0.7))

    # Print out coefficients
    coef.f <- coef(f)
    coef.f[,1]

    # Coefficient path plot
    plot(f, yvar=1)
    dev.new()

    # Coefficient plot of selected variables
    coefplot.spls(f, xvar=c(1:4))



