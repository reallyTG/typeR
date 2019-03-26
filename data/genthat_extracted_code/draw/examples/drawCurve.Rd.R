library(draw)


### Name: drawCurve
### Title: Draw a Curve on the Page
### Aliases: drawCurve

### ** Examples

library(draw)

# Set drawing settings
drawSettings(pageWidth = 5, pageHeight = 5, units = "inches")

# Create a new drawing page
drawPage()

# Draw a curved angle
drawCurve(x = c(1, 4),
          y = c(1, 2),
          angle = 90)

# Draw a curved angle with arrows
drawCurve(x = c(1, 4),
          y = c(2, 3.75),
          angle = 90, arrowLength = 0.1, arrowEnd = "both")

# Draw an inflected curve
drawCurve(x = c(1, 4),
          y = c(3, 4),
          angle = 90, inflect = TRUE)

# Export the drawing page to a PDF
drawExport("drawCurve.pdf")




