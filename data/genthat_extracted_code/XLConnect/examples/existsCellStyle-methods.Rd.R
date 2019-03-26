library(XLConnect)


### Name: existsCellStyle-methods
### Title: Retrieving named cell styles
### Aliases: existsCellStyle existsCellStyle-methods
###   existsCellStyle,workbook-method
### Keywords: methods utilities

### ** Examples

# Load workbook (create if not existing)
wb <- loadWorkbook("existsCellStyle.xlsx", create = TRUE)

# Cell style 'MyStyle' does not exist yet
stopifnot(!existsCellStyle(wb, "MyStyle"))

# Create the style "MyStyle"
createCellStyle(wb, "MyStyle")

# And now it is here
stopifnot(existsCellStyle(wb, "MyStyle"))



