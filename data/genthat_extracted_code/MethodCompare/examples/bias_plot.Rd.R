library(MethodCompare)


### Name: bias_plot
### Title: Plot used to visually assess the amount of bias of a new
###   measurement method relative to a reference standard
### Aliases: bias_plot

### ** Examples

### load the data
data(data1)
### analysis
measure_model <- measure_compare(data1)
### Bias plot
bias_plot(measure_model)




