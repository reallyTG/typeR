library(clinfun)


### Name: roc.curve
### Title: Empirical ROC curve
### Aliases: roc.curve print.roc.curve plot.roc.curve lines.roc.curve

### ** Examples

g <- rep(0:1, 50)
x <- rnorm(100) + g
y <- rnorm(100) + 1.5*g
o <- roc.curve(x, g)
plot(o)
lines(roc.curve(y, g), col=2)



