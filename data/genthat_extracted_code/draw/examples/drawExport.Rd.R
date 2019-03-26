library(draw)


### Name: drawExport
### Title: Export Current Drawing Page to a File
### Aliases: drawExport

### ** Examples

library(draw)

# Set drawing settings
drawSettings(pageWidth = 5, pageHeight = 5, units = "inches")

# Create a new drawing page
drawPage()

# Draw a square
drawBox(x = 1, y = 4, width = 2, height = 2)

# Export the drawing page to a PDF
drawExport("export.pdf")

# Export the drawing page to a PNG
drawExport("export.png", ppi=300)




