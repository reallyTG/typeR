library(tatoo)


### Name: as_workbook
### Title: Convert a Tatoo Table Object to an Excel Workbook
### Aliases: as_workbook as_workbook.default as_workbook.Tatoo_report
###   save_xlsx view_xlsx

### ** Examples

## Not run: 
##D dat <- data.frame(
##D   Species = c("setosa", "versicolor", "virginica"),
##D   length = c(5.01, 5.94, 6.59),
##D   width = c(3.43, 2.77, 2.97)
##D )
##D 
##D # Assign metadata to convert dat to a Tagged_table
##D 
##D title(dat) <- 'Iris excerpt'
##D footer(dat) <-  'An example based on the iris dataset'
##D 
##D 
##D # Convert to Workbook or save als xlsx
##D 
##D wb <- as_workbook(dat)
##D save_xlsx(dat, tempfile(fileext = ".xlsx"), overwrite = TRUE)
## End(Not run)




