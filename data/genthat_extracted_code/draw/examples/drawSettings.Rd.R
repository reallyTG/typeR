library(draw)


### Name: drawSettings
### Title: Modify Default Drawing Settings
### Aliases: drawSettings

### ** Examples

library(draw)

# Set page dimensions and units to inches
drawSettings(pageWidth = 5, pageHeight = 5, units = "inches")

# Set export resolution in Pixels Per Inch (PPI)
drawSettings(exportPPI = 300)

# Set default width and height for all boxes in inches
drawSettings(boxWidth = 1, boxHeight = 1)

# Create a new drawing page
drawPage()

# Draw default 1 by 1 inch boxes near the center
drawBox(x = 2, y = 2.5)
drawBox(x = 3, y = 2.5)

# Draw a non-default 2 by 2 inch box in the center
drawBox(x = 2.5, y = 2.5, width = 2, height = 2)

# Export the current drawing page
drawExport("drawSettingsExample.pdf")




