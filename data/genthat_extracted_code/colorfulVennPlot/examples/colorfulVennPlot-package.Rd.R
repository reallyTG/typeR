library(colorfulVennPlot)


### Name: colorfulVennPlot-package
### Title: Venn diagram with user-specified colors for 2-dimensional,
###   3-dimensional and 4-dimensional data
### Aliases: colorfulVennPlot-package colorfulVennPlot
### Keywords: package

### ** Examples

  data(survey, package = "MASS")
  # For more info: ?MASS::survey
  
  # Grouping students by Pulse, Height and Age
  vennData <- createVennData(survey,
    Cols = c("Pulse","Height","Age"),
    Splits = c(75, 170, 20),   ## Split Pulse at 75, split Height at 170, split Age at 20
    Labels = NULL,   ## Keep Labels NULL, as we wish to stick with Pulse, Height and Age titles.
    type = c("percent"))   ## generate data as percents

  # Plot Venn diagram
  # Notice: 
  # plotVenn is a generic function, which can be used to call plotVenn2d, plotVenn3d or plotVenn4d
  plot.new()
  plotVenn(vennData$x, vennData$labels)
  
  ##############################################
  # Example of 4-dimensional data plotting, with default data
  plot.new()
  plotVenn4d(Title = "Example of 4-d Venn diagram")




