library(nlstimedist)


### Name: tdCdfPlot
### Title: Plot the timedist PDF or CDF
### Aliases: tdCdfPlot tdPdfPlot

### ** Examples

tdTilia <- tdData(tilia, x = "Day", y = "Trees")
model <- timedist(data = tdTilia, x = "Day", y = "propMax", r = 0.1, c = 0.5,
                  t = 120)
tdCdfPlot(model)

tdPdfPlot(model)




