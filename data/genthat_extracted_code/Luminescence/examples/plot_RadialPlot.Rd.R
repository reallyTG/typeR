library(Luminescence)


### Name: plot_RadialPlot
### Title: Function to create a Radial Plot
### Aliases: plot_RadialPlot

### ** Examples


## load example data
data(ExampleData.DeValues, envir = environment())
ExampleData.DeValues <- Second2Gray(ExampleData.DeValues$BT998, c(0.0438,0.0019))

## plot the example data straightforward
plot_RadialPlot(data = ExampleData.DeValues)

## now with linear z-scale
plot_RadialPlot(data = ExampleData.DeValues,
                log.z = FALSE)

## now with output of the plot parameters
plot1 <- plot_RadialPlot(data = ExampleData.DeValues,
                         log.z = FALSE,
                         output = TRUE)
plot1
plot1$zlim

## now with adjusted z-scale limits
plot_RadialPlot(data = ExampleData.DeValues,
               log.z = FALSE,
               zlim = c(100, 200))

## now the two plots with serious but seasonally changing fun
#plot_RadialPlot(data = data.3, fun = TRUE)

## now with user-defined central value, in log-scale again
plot_RadialPlot(data = ExampleData.DeValues,
                central.value = 150)

## now with a rug, indicating individual De values at the z-scale
plot_RadialPlot(data = ExampleData.DeValues,
                rug = TRUE)

## now with legend, colour, different points and smaller scale
plot_RadialPlot(data = ExampleData.DeValues,
                legend.text = "Sample 1",
                col = "tomato4",
                bar.col = "peachpuff",
                pch = "R",
                cex = 0.8)

## now without 2-sigma bar, y-axis, grid lines and central value line
plot_RadialPlot(data = ExampleData.DeValues,
                bar.col = "none",
                grid.col = "none",
                y.ticks = FALSE,
                lwd = 0)

## now with user-defined axes labels
plot_RadialPlot(data = ExampleData.DeValues,
                xlab = c("Data error (%)",
                         "Data precision"),
                ylab = "Scatter",
                zlab = "Equivalent dose [Gy]")

## now with minimum, maximum and median value indicated
plot_RadialPlot(data = ExampleData.DeValues,
                central.value = 150,
                stats = c("min", "max", "median"))

## now with a brief statistical summary
plot_RadialPlot(data = ExampleData.DeValues,
                summary = c("n", "in.2s"))

## now with another statistical summary as subheader
plot_RadialPlot(data = ExampleData.DeValues,
                summary = c("mean.weighted", "median"),
                summary.pos = "sub")

## now the data set is split into sub-groups, one is manipulated
data.1 <- ExampleData.DeValues[1:15,]
data.2 <- ExampleData.DeValues[16:25,] * 1.3

## now a common dataset is created from the two subgroups
data.3 <- list(data.1, data.2)

## now the two data sets are plotted in one plot
plot_RadialPlot(data = data.3)

## now with some graphical modification
plot_RadialPlot(data = data.3,
                col = c("darkblue", "darkgreen"),
                bar.col = c("lightblue", "lightgreen"),
                pch = c(2, 6),
                summary = c("n", "in.2s"),
                summary.pos = "sub",
                legend = c("Sample 1", "Sample 2"))




