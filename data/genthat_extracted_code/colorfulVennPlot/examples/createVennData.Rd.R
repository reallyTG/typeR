library(colorfulVennPlot)


### Name: createVennData
### Title: Generates data for plotVenn3d()
### Aliases: createVennData
### Keywords: manip

### ** Examples

  data(survey, package = "MASS")
  # For more info: ?MASS::survey
  
  # Grouping students by Pulse, Height and Age
  plot.new()
  vennData <- createVennData(survey,
    Cols = c("Pulse","Height","Age"),
    Splits = c(75, 170, 20),   ## Split Pulse at 75, split Height at 170, split Age at 20
    Labels = NULL,   ## Keep Labels NULL, as we wish to stick with Pulse, Height and Age titles.
    type = c("percent"))   ## generate data as percents

  # Plot 
  plot.new()
  plotVenn3d(vennData$x, vennData$labels)
  # OR:
  plot.new()
  plotVenn(vennData$x, vennData$labels)
  



