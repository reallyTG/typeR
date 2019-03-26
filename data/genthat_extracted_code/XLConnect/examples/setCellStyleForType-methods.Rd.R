library(XLConnect)


### Name: setCellStyleForType-methods
### Title: Setting the cell style per data type for the DATATYPE style
###   action
### Aliases: setCellStyleForType setCellStyleForType-methods
###   setCellStyleForType,workbook-method
### Keywords: methods utilities

### ** Examples

file.copy(system.file("demoFiles/template2.xlsx", 
                      package = "XLConnect"),
          "datatype.xlsx", overwrite = TRUE)

# Load workbook
wb <- loadWorkbook("datatype.xlsx")

# Create a new cell style to be used
cs <- createCellStyle(wb, name = "mystyle")

# Set data format (number format) as numbers with aligned fractions
setDataFormat(cs, format = "# ???/???")

# Define the above created cell style as style to be used for
# numerics
setCellStyleForType(wb, type = XLC$"DATA_TYPE.NUMERIC", style = cs)
# Could also say cs <- setCellStyleForType(wb, "numeric")
          
# Set style action to 'datatype'
setStyleAction(wb, XLC$"STYLE_ACTION.DATATYPE")

# Write built-in data set 'mtcars' to the named region 
# 'mtcars' as defined by the Excel template.
writeNamedRegion(wb, mtcars, name = "mtcars")

# Save workbook
saveWorkbook(wb)



