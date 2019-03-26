library(draw)


### Name: drawPoint
### Title: Draw a Point on the Page
### Aliases: drawPoint

### ** Examples

library(draw)

# Set drawing settings
drawSettings(pageWidth = 5, pageHeight = 5, units = "inches")

# Create a new drawing page
drawPage()

# Draw a square point
drawPoint(x = 1, y = 4, pch = 0)

# Draw a larger circle point
drawPoint(x = 4, y = 4, pch = 1, size = 1.5)

# Draw a triangle point
drawPoint(x = 1, y = 1, pch = 2, lineWidth = 2)

# Draw a red X point
drawPoint(x = 4, y = 1, pch = 4, lineColor = "red")

# Export the drawing page to a PDF
drawExport("drawPoint.pdf")




