library(expss)


### Name: xl_write
### Title: Write tables and other objects to an xlsx file with formatting
### Aliases: xl_write xl_write.default xl_write.list xl_write.etable
###   xl_write.with_caption

### ** Examples

## Not run: 
##D library(openxlsx)
##D data(mtcars)
##D # add labels to dataset
##D mtcars = apply_labels(mtcars,
##D                       mpg = "Miles/(US) gallon",
##D                       cyl = "Number of cylinders",
##D                       disp = "Displacement (cu.in.)",
##D                       hp = "Gross horsepower",
##D                       drat = "Rear axle ratio",
##D                       wt = "Weight (lb/1000)",
##D                       qsec = "1/4 mile time",
##D                       vs = "Engine",
##D                       vs = c("V-engine" = 0,
##D                              "Straight engine" = 1),
##D                       am = "Transmission",
##D                       am = c("Automatic" = 0,
##D                              "Manual"=1),
##D                       gear = "Number of forward gears",
##D                       carb = "Number of carburetors"
##D )
##D 
##D # create table with caption
##D mtcars_table = calc_cro_cpct(mtcars,
##D                              cell_vars = list(cyl, gear),
##D                              col_vars = list(total(), am, vs)
##D ) %>% 
##D     set_caption("Table 1")
##D 
##D 
##D wb = createWorkbook()
##D sh = addWorksheet(wb, "Tables")
##D # export table
##D xl_write(mtcars_table, wb, sh)
##D saveWorkbook(wb, "table1.xlsx", overwrite = TRUE)
##D 
##D ## custom cells formatting
##D wb = createWorkbook()
##D sh = addWorksheet(wb, "Tables")
##D 
##D # we want to mark cells which are greater than total column
##D my_formatter = function(tbl){
##D     greater_than_total = tbl[,-1]>tbl[[2]]
##D     which(greater_than_total, arr.ind = TRUE)
##D }
##D # export table
##D xl_write(mtcars_table, wb, sh, 
##D     additional_cells_formats = list(
##D         list(my_formatter, createStyle(textDecoration =  "bold", fontColour = "blue"))
##D     )
##D )
##D saveWorkbook(wb, "table_with_additional_format.xlsx", overwrite = TRUE)
##D 
##D ## automated report generation on multiple variables with the same banner
##D  
##D banner = calc(mtcars, list(total(), am, vs))
##D 
##D # create list of tables
##D list_of_tables = lapply(mtcars, function(variable) {
##D     if(length(unique(variable))<7){
##D         cro_cpct(variable, banner) %>% significance_cpct()
##D     } else {
##D         # if number of unique values greater than seven we calculate mean
##D         cro_mean_sd_n(variable, banner) %>% significance_means()
##D         
##D     }
##D     
##D })
##D 
##D 
##D wb = createWorkbook()
##D sh = addWorksheet(wb, "Tables")
##D # export list of tables with additional formatting
##D xl_write(list_of_tables, wb, sh, 
##D          # remove '#' sign from totals 
##D          col_symbols_to_remove = "#",
##D          row_symbols_to_remove = "#",
##D          # format total column as bold
##D          other_col_labels_formats = list("#" = createStyle(textDecoration = "bold")),
##D          other_cols_formats = list("#" = createStyle(textDecoration = "bold")),
##D )
##D saveWorkbook(wb, "report.xlsx", overwrite = TRUE)
## End(Not run)



