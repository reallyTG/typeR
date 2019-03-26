library(MethodCompare)


### Name: precision_plot
### Title: Precision plot used to compare the standard deviation of a new
###   measurement method with that of a reference standard with possibly
###   heteroscedastic errors
### Aliases: precision_plot

### ** Examples

### load the data
data(data1)
### analysis
measure_model <- measure_compare(data1)
### Precision plot
precision_plot(measure_model)




