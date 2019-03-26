library(XLConnect)


### Name: getOrCreateCellStyle-methods
### Title: Retrieving or creating named cell styles
### Aliases: getOrCreateCellStyle getOrCreateCellStyle-methods
###   getOrCreateCellStyle,workbook,character-method
### Keywords: methods utilities

### ** Examples

# Load workbook (create if not existing)
wb <- loadWorkbook("getOrCreateCellStyle.xlsx", create = TRUE)

# The first time, the style does not exist yet and gets created
myStyle <- getOrCreateCellStyle(wb, name = "MyStyle")

# The second time, we retrieve the already existing style 
myStyle <- getOrCreateCellStyle(wb, name = "MyStyle")



