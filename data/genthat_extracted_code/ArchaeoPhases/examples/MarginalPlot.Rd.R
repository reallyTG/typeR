library(ArchaeoPhases)


### Name: MarginalPlot
### Title: Plot of a marginal posterior density
### Aliases: MarginalPlot
### Keywords: marginal posterior density credible interval mean

### ** Examples

  data(Events); attach(Events)

  MarginalPlot(Event.1, level = 0.95)
  MarginalPlot(Event.1, level = 0.50)

  MarginalPlot(Event.2, level = 0.95, title="Characteristics of Event 2")
  MarginalPlot(Event.2, level = 0.95, colors = FALSE)
  MarginalPlot(Event.2, level = 0.95, colors = FALSE, 
  exportFile = "Characteristics_Event.2", exportFormat = "SVG")



