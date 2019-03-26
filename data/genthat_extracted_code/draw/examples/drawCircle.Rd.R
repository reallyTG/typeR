library(draw)


### Name: drawCircle
### Title: Draw a Circle on the Page
### Aliases: drawCircle

### ** Examples

library(draw)

# Set drawing settings
drawSettings(pageWidth = 5, pageHeight = 5, units = "inches")

# Create a new drawing page
drawPage()

# Draw a small circle
drawCircle(x = 2.5, y = 2.5, radius = 0.5)

# Draw a mid sized circle
drawCircle(x = 2.5, y = 2.5, radius = 1)

# Draw a large circle
drawCircle(x = 2.5, y = 2.5, radius = 2)

# Export the drawing page to a PDF
drawExport("drawCircle.pdf")




