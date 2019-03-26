library(draw)


### Name: drawLine
### Title: Draw a Line on the Page
### Aliases: drawLine

### ** Examples

library(draw)

# Set drawing settings
drawSettings(pageWidth = 5, pageHeight = 5, units = "inches")

# Create a new drawing page
drawPage()

# Draw a solid line
drawLine(x = c(1, 4),
         y = c(1 ,1))

# Draw a dashed line
drawLine(x = c(1, 4),
         y = c(2 ,2),
         lineType = "dashed")

# Draw a dotted line with ending arrow
drawLine(x = c(1, 4),
         y = c(3 ,3),
         lineType = "dotted", arrowEnds = "last")

# Draw thick two dash line with starting arrow
drawLine(x = c(1, 4),
         y = c(4, 4),
         lineWidth = 3, lineType = "twodash", arrowEnds = "first")

# Export the drawing page to a PDF
drawExport("drawLine.pdf")




