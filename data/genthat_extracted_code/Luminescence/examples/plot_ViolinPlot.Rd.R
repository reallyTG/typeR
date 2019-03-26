library(Luminescence)


### Name: plot_ViolinPlot
### Title: Create a violin plot
### Aliases: plot_ViolinPlot

### ** Examples


## read example data set
data(ExampleData.DeValues, envir = environment())
ExampleData.DeValues <- Second2Gray(ExampleData.DeValues$BT998, c(0.0438,0.0019))

## create plot straightforward
plot_ViolinPlot(data = ExampleData.DeValues)




