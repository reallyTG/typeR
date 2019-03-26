library(draw)


### Name: drawBox
### Title: Draw a Box on the Page
### Aliases: drawBox

### ** Examples

library(draw)

# Set drawing settings
drawSettings(pageWidth = 5, pageHeight = 5, units = "inches")

# Create a new drawing page
drawPage()

# Draw a square
drawBox(x = 1, y = 4, width = 1, height = 1)

# Draw a square with rounded corners
drawBox(x = 4, y = 4, width = 1, height = 1, radius = 0.25)

# Draw a rectangle
drawBox(x = 1, y = 1, width = 1, height = 0.5)

# Draw a rectangle with rounded corners
drawBox(x = 4, y = 1, width = 1, height = 0.5, radius = 0.25)

# Export the drawing page to a PDF
drawExport("drawBox.pdf")




