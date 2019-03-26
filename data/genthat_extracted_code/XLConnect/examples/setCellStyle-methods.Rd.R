library(XLConnect)


### Name: setCellStyle-methods
### Title: Setting cell styles
### Aliases: setCellStyle setCellStyle-methods
###   setCellStyle,workbook,missing,character-method
###   setCellStyle,workbook,missing,numeric-method
###   setCellStyle,workbook,character,missing-method
### Keywords: methods utilities

### ** Examples

# Load workbook (create if not existing)
wb <- loadWorkbook("setCellStyle.xlsx", create = TRUE)

# We don't set a specific style action in this demo, so the default 
# 'XLConnect' will be used (XLC$"STYLE_ACTION.XLCONNECT")

# Create a sheet named 'mtcars'
createSheet(wb, name = "mtcars")

# Create a named region called 'mtcars' referring to the sheet
# called 'mtcars'
createName(wb, name = "mtcars", formula = "mtcars!$C$4")

# Write built-in data set 'mtcars' to the above defined named region.
# This will use the default style action 'XLConnect'.
writeNamedRegion(wb, mtcars, name = "mtcars")

# Now let's color all weight cells of cars with a weight > 3.5 in red
# (mtcars$wt > 3.5)

# First, create a corresponding (named) cell style
heavyCar <- createCellStyle(wb, name = "HeavyCar")

# Specify the cell style to use a solid foreground color
setFillPattern(heavyCar, fill = XLC$"FILL.SOLID_FOREGROUND")

# Specify the foreground color to be used
setFillForegroundColor(heavyCar, color = XLC$"COLOR.RED")

# Which cars have a weight > 3.5 ?
rowIndex <- which(mtcars$wt > 3.5)

# NOTE: The mtcars data.frame has been written offset with
# top left cell C4 - and we have also written a header row!
# So, let's take that into account appropriately. Obviously,
# the two steps could be combined directly into one ...
rowIndex <- rowIndex + 4

# The same holds for the column index
colIndex <- which(names(mtcars) == "wt") + 2

# Set the 'HeavyCar' cell style for the corresponding cells.
# Note: the row and col arguments are vectorized!
setCellStyle(wb, sheet = "mtcars", row = rowIndex, col = colIndex, 
             cellstyle = heavyCar)

# Save workbook (this actually writes the file to disk)
saveWorkbook(wb)



