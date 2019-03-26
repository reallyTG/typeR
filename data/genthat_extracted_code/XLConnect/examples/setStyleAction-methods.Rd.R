library(XLConnect)


### Name: setStyleAction-methods
### Title: Controlling application of cell styles when writing data to
###   Excel
### Aliases: setStyleAction setStyleAction-methods
###   setStyleAction,workbook-method
### Keywords: methods utilities

### ** Examples

# Load workbook (create if not existing)
wb <- loadWorkbook("styleaction.xlsx", create = TRUE)

# Set style action to 'name prefix' 
setStyleAction(wb, XLC$"STYLE_ACTION.NAME_PREFIX")
# Set the name prefix to 'MyPersonalStyle'
setStyleNamePrefix(wb, "MyPersonalStyle")

# We now create a named cell style to be used for the header 
# (column names) of a data.frame
headerCellStyle <- createCellStyle(wb, 
                             name = "MyPersonalStyle.Header")

# Specify the cell style to use a solid foreground color
setFillPattern(headerCellStyle, 
               fill = XLC$"FILL.SOLID_FOREGROUND")

# Specify the foreground color to be used
setFillForegroundColor(headerCellStyle, 
                    color = XLC$"COLOR.LIGHT_CORNFLOWER_BLUE")

# Specify a thick black bottom border
setBorder(headerCellStyle, side = "bottom", 
          type = XLC$"BORDER.THICK", 
          color = XLC$"COLOR.BLACK")

# We now create a named cell style to be used for 
# the column named 'wt' (as you will see below, we will 
# write the built-in data.frame 'mtcars')
wtColumnCellStyle <- createCellStyle(wb, 
                           name = "MyPersonalStyle.Column.wt")

# Specify the cell style to use a solid foreground color
setFillPattern(wtColumnCellStyle, 
               fill = XLC$"FILL.SOLID_FOREGROUND")

# Specify the foreground color to be used
setFillForegroundColor(wtColumnCellStyle, 
                       color = XLC$"COLOR.LIGHT_ORANGE")

# We now create a named cell style to be used for 
# the 3rd column in the data.frame
wtColumnCellStyle <- createCellStyle(wb, 
                            name = "MyPersonalStyle.Column.3")

# Specify the cell style to use a solid foreground color
setFillPattern(wtColumnCellStyle, 
               fill = XLC$"FILL.SOLID_FOREGROUND")

# Specify the foreground color to be used
setFillForegroundColor(wtColumnCellStyle, 
                       color = XLC$"COLOR.LIME")

# Create a sheet named 'mtcars'
createSheet(wb, name = "mtcars")

# Create a named region called 'mtcars' referring to 
# the sheet called 'mtcars'
createName(wb, name = "mtcars", formula = "mtcars!$A$1")

# Write built-in data set 'mtcars' to the above defined named region.
# The style action 'name prefix' will be used when writing the data
# as defined above.
writeNamedRegion(wb, mtcars, name = "mtcars")

# Save workbook (this actually writes the file to disk)
saveWorkbook(wb)



