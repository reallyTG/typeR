library(funData)


### Name: autoplot.multiFunData
### Title: Visualize multivariate functional data objects using ggplot
### Aliases: autoplot.multiFunData

### ** Examples

# Load packages ggplot2 and gridExtra before running the examples
library("ggplot2"); library("gridExtra")

# One-dimensional elements
argvals <- seq(0, 2*pi, 0.01)
f1 <- funData(argvals, outer(seq(0.75, 1.25, length.out = 11), sin(argvals)))
f2 <- funData(argvals, outer(seq(0.75, 1.25, length.out = 11), cos(argvals)))

m1 <- multiFunData(f1, f2)

g <- autoplot(m1) # default
g[[1]] # plot first element
g[[2]] # plot second element
gridExtra::grid.arrange(grobs = g, nrow = 1) # requires gridExtra package

autoplot(m1, plotGrid = TRUE) # the same directly with plotGrid = TRUE

## No test: 
# Mixed-dimensional elements
X <- array(0, dim = c(11, length(argvals), length(argvals)))
X[1,,] <- outer(argvals, argvals, function(x,y){sin((x-pi)^2 + (y-pi)^2)})
f2 <- funData(list(argvals, argvals), X)

m2 <- multiFunData(f1, f2)

autoplot(m2, obs = 1, plotGrid = TRUE)

# Customizing plots (see ggplot2 documentation for more details)
g2 <- autoplot(m2, obs = 1)
g2[[1]] <- g2[[1]] + ggtitle("First element") + theme_bw()
g2[[2]] <- g2[[2]] + ggtitle("Second element") + 
                     scale_fill_gradient(high = "green", low = "blue")
gridExtra::grid.arrange(grobs = g2, nrow = 1) # requires gridExtra package
## End(No test)



