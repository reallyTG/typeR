library(mrfDepth)


### Name: mrainbowplot
### Title: Rainbow plot for bivariate data
### Aliases: mrainbowplot
### Keywords: Graphical

### ** Examples

data(cardata90)
Result <- projdepth(x = cardata90)
plot.options <- list(legend.title = "PD")
plot <- mrainbowplot(cardata90,
                     depths = Result$depthZ, plot.options = plot.options)
library("ggplot2")
plot + ggtitle("Rainbowplot of the cardata using projection depth.")

#The default color range may be adjusted using the col argument.
RGBmatrix <- c(1, 0, 0, #Red
               1, 1, 1, #White
               0, 1, 0) #Green
RGBmatrix <- matrix(RGBmatrix, ncol = 3, byrow = TRUE)
plot <- mrainbowplot(cardata90, 
                     depths = Result$depthZ, col = RGBmatrix,
                     plot.options = plot.options)
plot + ggtitle("Rainbowplot of the cardata using projection depth.")




