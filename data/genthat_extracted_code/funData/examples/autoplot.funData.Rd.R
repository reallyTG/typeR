library(funData)


### Name: autoplot.funData
### Title: Visualize functional data objects using ggplot
### Aliases: autoplot.funData autolayer.funData

### ** Examples

# Install / load package ggplot2 before running the examples
library("ggplot2")

# One-dimensional
argvals <- seq(0,2*pi,0.01)
object <- funData(argvals,
                   outer(seq(0.75, 1.25, length.out = 11), sin(argvals)))

g <- autoplot(object) # returns ggplot object
g # plot the object

# add the mean function in red
g + autolayer(meanFunction(object),  col = 2)

# Two-dimensional
X <- array(0, dim = c(2, length(argvals), length(argvals)))
X[1,,] <- outer(argvals, argvals, function(x,y){sin((x-pi)^2 + (y-pi)^2)})
X[2,,] <- outer(argvals, argvals, function(x,y){sin(2*x*pi) * cos(2*y*pi)})
object2D <- funData(list(argvals, argvals), X)

## No test: 
autoplot(object2D, obs = 1)
autoplot(object2D, obs = 2)
## End(No test)
## Not run: autoplot(object2D) # must specify obs!

### More examples ###
## No test: 
par(mfrow = c(1,1))

# using plotNA (needs packages zoo and gridExtra)
## Don't show: 
requireNamespace("zoo", quietly = TRUE)
## End(Don't show)
## Don't show: 
requireNamespace("gridExtra", quietly = TRUE)
## End(Don't show)
objectMissing <- funData(1:5, rbind(c(1, NA, 5, 4, 3), c(10, 9, NA, NA, 6)))
g1 <- autoplot(objectMissing) # the default
g2 <- autoplot(objectMissing, plotNA = TRUE) # requires zoo

gridExtra::grid.arrange(g1 + ggtitle("plotNA = FALSE (default)"),
                        g2 + ggtitle("plotNA = TRUE")) # requires gridExtra

# Customizing plots (see ggplot2 documentation for more details)
# parameters passed to geom_line are passed via the ... argument
gFancy <- autoplot(object, color = "red", linetype = 2) 
gFancy

# new layers can be added directly to the ggplot object
gFancy + theme_bw() # add new layers to the ggplot object
gFancy + ggtitle("Fancy Plot with Title and Axis Legends") + 
         xlab("The x-Axis") + ylab("The y-Axis")

autoplot(object2D, obs = 1) + ggtitle("Customized 2D plot") + theme_minimal() +
          scale_fill_gradient(high = "green", low = "blue", name = "Legend here")
## End(No test)



