library(funData)


### Name: autoplot.irregFunData
### Title: Visualize irregular functional data objects using ggplot
### Aliases: autoplot.irregFunData autolayer.irregFunData

### ** Examples

# Install / load package ggplot2 before running the examples
library("ggplot2")

# Generate data
argvals <- seq(0,2*pi,0.01)
ind <- replicate(5, sort(sample(1:length(argvals), sample(5:10,1))))
object <- irregFunData(argvals = lapply(ind, function(i){argvals[i]}),
                  X = lapply(ind, function(i){sample(1:10,1) / 10 * argvals[i]^2}))

# Plot the data
autoplot(object)

 # Parameters passed to geom_line are passed via the ... argument
autoplot(object, color = "red", linetype = 3)

# Plot the data and add green dots for the 2nd function
autoplot(object) + autolayer(object, obs = 2, geom = "point", color = "green")

# New layers can be added directly to the ggplot object using functions from the ggplot2 package
g <- autoplot(object)
g + theme_bw() + ggtitle("Plot with minimal theme and axis labels") +
    xlab("The x-Axis") + ylab("The y-Axis")



