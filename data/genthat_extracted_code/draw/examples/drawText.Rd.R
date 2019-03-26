library(draw)


### Name: drawText
### Title: Draw Text on the Page
### Aliases: drawText

### ** Examples

library(draw)

# Set drawing settings
drawSettings(pageWidth = 5, pageHeight = 5, units = "inches")

# Create a new drawing page
drawPage()

# Draw text on top left corner
drawText(x = 1, y = 4, text = "Top Left")

# Draw bold text on top right corner
drawText(x = 4, y = 4, text = "Top Right", face = "bold")

# Draw serif text on bottom left corner
drawText(x = 1, y = 1, text = "Bottom Left", family = "serif")

# Draw larger text on bottom right corner
drawText(x = 4, y = 1, text = "Bottom Right", size = 14)

# Export the drawing page to a PDF
drawExport("drawText.pdf")




