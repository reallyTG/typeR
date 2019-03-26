library(rio)


### Name: export
### Title: Export
### Aliases: export

### ** Examples

library("datasets")
# specify only `file` argument
export(mtcars, "mtcars.csv")

## Not run: 
##D # Stata does not recognize variables names with '.'
##D export(mtcars, "mtcars.dta")
## End(Not run)

# specify only `format` argument
"mtcars.dta" %in% dir()
export(mtcars, format = "stata")
"mtcars.dta" %in% dir()

# specify `file` and `format` to override default format
export(mtcars, file = "mtcars.txt", format = "csv")

# export multiple objects to Rdata
export(list(mtcars = mtcars, iris = iris), "mtcars.rdata")
export(c("mtcars", "iris"), "mtcars.rdata")

# export to JSON
export(mtcars, "mtcars.json")

# pass arguments to underlying export function
export(mtcars, "mtcars.csv", col.names = FALSE)

# write data to .R syntax file and append additional data
export(mtcars, file = "data.R", format = "dump")
export(mtcars, file = "data.R", format = "dump", append = TRUE)
source("data.R", echo = TRUE)

# write to an Excel workbook
## Not run: 
##D   ## export a single data frame
##D   export(mtcars, "mtcars.xlsx")
##D   
##D   ## export a list of data frames as worksheets
##D   export(list(a = mtcars, b = iris), "multisheet.xlsx")
##D 
##D   ## export, adding sheet to an existing workbook
##D   export(iris, "mtcars.xlsx", which = "iris", overwrite = FALSE)
## End(Not run)

# write data to a zip-compressed CSV
export(mtcars, "mtcars.csv.zip")

# cleanup
unlink("mtcars.csv")
unlink("mtcars.dta")
unlink("mtcars.json")
unlink("mtcars.rdata")
unlink("data.R")
unlink("mtcars.csv.zip")



