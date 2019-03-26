library(cnmlcd)


### Name: plotgradient
### Title: Plot Gradient Curve
### Aliases: plotgradient

### ** Examples

data(logreturn)
r = cnmlcd(logreturn)
plot(r$lcd, logreturn)            # Density
plotgradient(r$lcd, logreturn)    # Gradient



