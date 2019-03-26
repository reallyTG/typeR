library(XLConnect)


### Name: isSheetVeryHidden-methods
### Title: Checking if worksheets are very hidden in a workbook
### Aliases: isSheetVeryHidden isSheetVeryHidden-methods
###   isSheetVeryHidden,workbook,character-method
###   isSheetVeryHidden,workbook,numeric-method
### Keywords: methods utilities

### ** Examples

# Load workbook (create if not existing)
wb <- loadWorkbook("isSheetVeryHidden.xlsx", create = TRUE)

# Write a couple of built-in data.frame's into sheets
# with corresponding name
for(obj in c("CO2", "airquality", "swiss")) {
  createSheet(wb, name = obj)
  writeWorksheet(wb, get(obj), sheet = obj)
}

# Very hide sheet 'airquality'
hideSheet(wb, sheet = "airquality", veryHidden = TRUE)

# Hide sheet 'CO2'
hideSheet(wb, sheet = "CO2", veryHidden = FALSE)

# Check if sheet 'airquality' is very hidden;
# this should obviously return TRUE
isSheetVeryHidden(wb, "airquality")

# Check if sheet 'swiss' is very hidden;
# this should obviously return FALSE
isSheetVeryHidden(wb, "swiss")

# Check if sheet 'CO2' is very hidden;
# this should also return FALSE - the sheet
# is just hidden but not very hidden
isSheetVeryHidden(wb, "CO2")




