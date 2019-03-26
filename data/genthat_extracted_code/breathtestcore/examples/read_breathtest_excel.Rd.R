library(breathtestcore)


### Name: read_breathtest_excel
### Title: Reads breathtest data in Excel format
### Aliases: read_breathtest_excel

### ** Examples

filename = btcore_file("ExcelSamples.xlsx")
sheets = readxl::excel_sheets(filename)
# First 4 lines of each sheet
for (sheet in sheets) {
  cat("\nSheet ", sheet,"\n")
  ex = readxl::read_excel(filename, sheet = sheet, n_max = 4)
  print(ex)
}  
# To get consistently formatted data from a sheet
bt_data = read_breathtest_excel(filename, sheets[6])
# 3 columns
str(bt_data)
bt_cleaned = cleanup_data(bt_data)
# 4 columns standard format
str(bt_cleaned)



