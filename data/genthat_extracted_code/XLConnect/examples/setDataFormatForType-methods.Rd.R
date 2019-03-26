library(XLConnect)


### Name: setDataFormatForType-methods
### Title: Setting the data format for the DATA_FORMAT_ONLY style action
### Aliases: setDataFormatForType setDataFormatForType-methods
###   setDataFormatForType,workbook-method
### Keywords: methods utilities

### ** Examples

# Copy existing Excel template to working directory
file.copy(system.file("demoFiles/template2.xlsx", 
                      package = "XLConnect"),
          "dataformat.xlsx", overwrite = TRUE)

# Load workbook
wb <- loadWorkbook("dataformat.xlsx")

# Set the data format for numeric columns (cells)
# (keeping the defaults for all other data types)
setDataFormatForType(wb, type = XLC$"DATA_TYPE.NUMERIC", 
                     format = "0.00")

# Set style action to 'data format only'
setStyleAction(wb, XLC$"STYLE_ACTION.DATA_FORMAT_ONLY")

# Write built-in data set 'mtcars' to the named region 
# 'mtcars' as defined by the Excel template.
writeNamedRegion(wb, mtcars, name = "mtcars")

# Save workbook
saveWorkbook(wb)



