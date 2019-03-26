library(RChronoModel)


### Name: MultiDatesPlot
### Title: Plot of the endpoints of credible intervals or HPD intervals of
###   a series of dates
### Aliases: MultiDatesPlot
### Keywords: credible interval highest posterior density regions

### ** Examples

  data(Events)
  MultiDatesPlot(Events, c(2,4,3), level = 0.95, intervals ="CI", title = "Plot of CI intervals")
  MultiDatesPlot(Events, c(2,4,3), level = 0.95, intervals ="HPD", title = "Plot of HPD intervals")



