library(XLConnect)


### Name: getCellStyleForType-methods
### Title: Querying the cell style per data type for the DATATYPE style
###   action
### Aliases: getCellStyleForType getCellStyleForType-methods
###   getCellStyleForType,workbook-method
### Keywords: methods utilities

### ** Examples

file.copy(system.file("demoFiles/template2.xlsx", 
                      package = "XLConnect"),
          "datatype.xlsx", overwrite = TRUE)

# Load workbook
wb <- loadWorkbook("datatype.xlsx")

# Get current (existing) cell style for numerics
cs <- getCellStyleForType(wb, XLC$"DATA_TYPE.NUMERIC")
# Could also say cs <- getCellStyleForType(wb, "numeric")

# Change style
setBorder(cs, side = c("bottom", "right"), type = XLC$"BORDER.THICK", 
          color = c(XLC$"COLOR.BLACK", XLC$"COLOR.RED"))
          
# Set style action to 'datatype'
setStyleAction(wb, XLC$"STYLE_ACTION.DATATYPE")

# Write built-in data set 'mtcars' to the named region 
# 'mtcars' as defined by the Excel template.
writeNamedRegion(wb, mtcars, name = "mtcars")

# Save workbook
saveWorkbook(wb)



