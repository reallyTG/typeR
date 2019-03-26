library(bfw)


### Name: ParsePlot
### Title: Parse Plot
### Aliases: ParsePlot

### ** Examples

# Create three plots
plot.data <- lapply(1:3, function (i) {
  # Open new device
  grDevices::dev.new()
  # Print plot
  plot(1:i)
  # Record plot
  p <- grDevices::recordPlot()
  # Turn off graphics device drive
  grDevices::dev.off()
  return (p)
} )

# Print plots
ParsePlot(plot.data)
## No test: 
# Save plots as png with a4 layout and return file names
project.dir <- tempdir()
project.name <- FileName(name="Testing-Plot")
ParsePlot(plot.data,
          project.dir = project.dir,
          project.name = project.name,
          graphic.type = "png",
          save.data = TRUE,
          layout = "a4",
          return.files = TRUE
)
# [1] "\\Temp/Project-Testing-Plot01-1528833217.png"
# [2] "\\Temp/Project-Testing-Plot02-1528833217.png"
# [3] "\\Temp/Project-Testing-Plot03-1528833217.png"
# Save plots as single PowerPoint (default) and return file names
project.dir <- tempdir()
project.name <- FileName(name="Testing-Plot")
ParsePlot(plot.data,
          project.dir = project.dir,
          project.name = project.name,
          vector.graphic = FALSE,
          graphic.type = "pptx",
          layout = "pw",
          save.data = TRUE,
          return.files = TRUE
)
# [1] "\\Temp/Project-Testing-Plot-1528833342.pptx"
## End(No test)



