library(XLConnect)


### Name: hideSheet-methods
### Title: Hiding worksheets in a workbook
### Aliases: hideSheet hideSheet-methods
###   hideSheet,workbook,character-method hideSheet,workbook,numeric-method
### Keywords: methods utilities

### ** Examples

# Load workbook (create if not existing)
wb <- loadWorkbook("hiddenWorksheet.xlsx", create = TRUE)

# Write a couple of built-in data.frame's into sheets
# with corresponding name
for(obj in c("CO2", "airquality", "swiss")) {
  createSheet(wb, name = obj)
  writeWorksheet(wb, get(obj), sheet = obj)
}

# Hide sheet 'airquality';
# the sheet may be unhidden by a user from within Excel
# since veryHidden defaults to FALSE
hideSheet(wb, sheet = "airquality")

# Save workbook
saveWorkbook(wb)



