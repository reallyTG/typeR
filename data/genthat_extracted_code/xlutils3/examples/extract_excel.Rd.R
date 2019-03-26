library(xlutils3)


### Name: extract_excel
### Title: A function that extracts all '.xls[x]' files in a folder
### Aliases: extract_excel

### ** Examples

## Not run: 
##D # Where your Excel files are located
##D folder <- "./excel data/"
##D 
##D # First try without parameters
##D data_ <- extract_excel(folder)
##D 
##D # View all data
##D view_excel(data_)
##D 
##D # Second try with adjustments where things went wrong
##D weird_cases <- list(
##D   "first workbook.xls" = list(
##D     "sheet2" = list(skip = 3),
##D     "sheet3" = list(skip = 2)
##D   ),
##D   "wb2.xlsx" = list(
##D     "tab2" = list(skip = 3, col_names = FALSE)
##D   )
##D )
##D data_ <- extract_excel(folder, weird_cases)
## End(Not run)



