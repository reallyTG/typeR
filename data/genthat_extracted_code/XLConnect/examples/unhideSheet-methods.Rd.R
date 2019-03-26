library(XLConnect)


### Name: unhideSheet-methods
### Title: Unhiding worksheets in a workbook
### Aliases: unhideSheet unhideSheet-methods
###   unhideSheet,workbook,character-method
###   unhideSheet,workbook,numeric-method
### Keywords: methods utilities

### ** Examples

# Load workbook (create if not existing)
wb <- loadWorkbook("unhideWorksheet.xlsx", create = TRUE)

# Create sheet 'airquality'
createSheet(wb, name = "airquality")

# Write the built-in data set airquality to worksheet
# 'airquality'
writeWorksheet(wb, airquality, sheet = "airquality")

# Create sheet 'CO2'
createSheet(wb, name = "CO2")

# Write the built-in data set CO2 to worksheet 'C02'
writeWorksheet(wb, CO2, sheet = "CO2")

# Hide sheet 'airquality'
hideSheet(wb, sheet = "airquality")

# Unhide sheet 'airquality'
unhideSheet(wb, sheet = "airquality")



