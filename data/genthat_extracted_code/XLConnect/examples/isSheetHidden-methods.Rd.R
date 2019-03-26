library(XLConnect)


### Name: isSheetHidden-methods
### Title: Checking if worksheets are hidden in a workbook
### Aliases: isSheetHidden isSheetHidden-methods
###   isSheetHidden,workbook,character-method
###   isSheetHidden,workbook,numeric-method
### Keywords: methods utilities

### ** Examples

# Load workbook (create if not existing)
wb <- loadWorkbook("isSheetHidden.xlsx", create = TRUE)

# Write a couple of built-in data.frame's into sheets
# with corresponding name
for(obj in c("CO2", "airquality", "swiss")) {
  createSheet(wb, name = obj)
  writeWorksheet(wb, get(obj), sheet = obj)
}

# Hide sheet 'airquality'
hideSheet(wb, sheet = "airquality")

# Check if sheet 'airquality' is hidden;
# this should obviously return TRUE
isSheetHidden(wb, "airquality")

# Check if sheet 'swiss' is hidden;
# this should obviously return FALSE
isSheetHidden(wb, "swiss")




