library(RChronoModel)


### Name: MarginalPlot
### Title: Plot of a marginal posterior density
### Aliases: MarginalPlot
### Keywords: marginal posterior density credible interval mean

### ** Examples

  data(Events); attach(Events)

  MarginalPlot(Event.1, 0.95)
  MarginalPlot(Event.1, 0.50)

  MarginalPlot(Event.2, 0.95, title="Marginal density plot of Event 2")
  MarginalPlot(Event.2, 0.95, colors = FALSE)



