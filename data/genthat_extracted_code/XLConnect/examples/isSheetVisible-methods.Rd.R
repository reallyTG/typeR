library(XLConnect)


### Name: isSheetVisible-methods
### Title: Checking if worksheets are visible in a workbook
### Aliases: isSheetVisible isSheetVisible-methods
###   isSheetVisible,workbook,character-method
###   isSheetVisible,workbook,numeric-method
### Keywords: methods utilities

### ** Examples

# Load workbook (create if not existing)
wb <- loadWorkbook("isSheetVisible.xlsx", create = TRUE)

# Write a couple of built-in data.frame's into sheets
# with corresponding name
for(obj in c("CO2", "airquality", "swiss")) {
  createSheet(wb, name = obj)
  writeWorksheet(wb, get(obj), sheet = obj)
}

# Hide sheet 'CO2'
hideSheet(wb, sheet = "CO2", veryHidden = FALSE)

# Very hide sheet 'airquality'
hideSheet(wb, sheet = "airquality", veryHidden = TRUE)

# Check if sheet 'swiss' is visible;
# this should obviously return TRUE
isSheetVisible(wb, "swiss")

# Check if sheet 'CO2' is visible;
# this should obviously return FALSE
isSheetVisible(wb, "CO2")

# Check if sheet 'airquality' is visible;
# this should obviously return FALSE
isSheetVisible(wb, "airquality")




