library(WVPlots)


### Name: ScatterBoxPlot
### Title: Plot a scatter box plot.
### Aliases: ScatterBoxPlot

### ** Examples


classes = c("a", "b", "c")
means = c(2, 4, 3)
names(means) = classes
label = sample(classes, size=1000, replace=TRUE)
meas = means[label] + rnorm(1000)
frm2 = data.frame(label=label,
                  meas = meas)
WVPlots::ScatterBoxPlot(frm2, "label", "meas", pt_alpha=0.2, title="Example Scatter/Box plot")




