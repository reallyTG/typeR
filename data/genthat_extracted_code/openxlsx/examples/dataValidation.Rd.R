library(openxlsx)


### Name: dataValidation
### Title: Add data validation to cells
### Aliases: dataValidation

### ** Examples

wb <- createWorkbook()
addWorksheet(wb, "Sheet 1")
addWorksheet(wb, "Sheet 2")

writeDataTable(wb, 1, x = iris[1:30,])

dataValidation(wb, 1, col = 1:3, rows = 2:31, type = "whole"
   , operator = "between", value = c(1, 9))

dataValidation(wb, 1, col = 5, rows = 2:31, type = "textLength"
   , operator = "between", value = c(4, 6))


## Date and Time cell validation
df <- data.frame("d" = as.Date("2016-01-01") + -5:5,
                 "t" = as.POSIXct("2016-01-01")+ -5:5*10000)
                 
writeData(wb, 2, x = df)
dataValidation(wb, 2, col = 1, rows = 2:12, type = "date", 
   operator = "greaterThanOrEqual", value = as.Date("2016-01-01"))

dataValidation(wb, 2, col = 2, rows = 2:12, type = "time", 
   operator = "between", value = df$t[c(4, 8)]) 

saveWorkbook(wb, "dataValidationExample.xlsx", overwrite = TRUE)


######################################################################
## If type == 'list'
# operator argument is ignored.

wb <- createWorkbook()
addWorksheet(wb, "Sheet 1")
addWorksheet(wb, "Sheet 2")

writeDataTable(wb, sheet = 1, x = iris[1:30,])
writeData(wb, sheet = 2, x = sample(iris$Sepal.Length, 10))

dataValidation(wb, 1, col = 1, rows = 2:31, type = "list", value = "'Sheet 2'!$A$1:$A$10")

# openXL(wb)




