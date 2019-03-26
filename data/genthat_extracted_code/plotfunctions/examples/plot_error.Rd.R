library(plotfunctions)


### Name: plot_error
### Title: Utility function
### Aliases: plot_error

### ** Examples


# generate some data:
x <- -10:20
y <- 0.3*(x - 3)^2 + rnorm(length(x))
s <- 0.2*abs(100-y + rnorm(length(x)))

# Plot line and standard deviation:
emptyPlot(range(x), range(y), h0=0)
plot_error(x, y, s)
# Change layout:
emptyPlot(range(x), range(y), h0=0)
plot_error(x, y, s, shade=TRUE, lty=3, lwd=3)

# Use of se.fit2 for asymmetrical error bars:
cu <- y + .65*s
cl <- y - s
emptyPlot(range(x), range(y), h0=0)
plot_error(x, y, s, shade=TRUE)
plot_error(x, y, se.fit=cu, se.fit2=cl, col='red', shade=TRUE)

# Some layout options:
emptyPlot(range(x), range(y), h0=0)
plot_error(x, y, s, lty=3, lwd=1, ci.lty=1, ci.lwd=3)
emptyPlot(range(x), range(y), h0=0)
plot_error(x, y, s, shade=TRUE, lty=3, lwd=3)
emptyPlot(range(x), range(y), h0=0)
plot_error(x, y, s, shade=TRUE, lty=1, lwd=3, ci.lwd=3, border='red')
emptyPlot(range(x), range(y), h0=0)
plot_error(x, y, s, shade=TRUE, lty=1, lwd=3, density=10, ci.lwd=3)




