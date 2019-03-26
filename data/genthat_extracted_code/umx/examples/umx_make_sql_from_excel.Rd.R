library(umx)


### Name: umx_make_sql_from_excel
### Title: Convert an excel spreadsheet in a text file on sql statements.
### Aliases: umx_make_sql_from_excel

### ** Examples

## Not run: 
##D # An example Excel spreadsheet
##D # local uncompiled path
##D fp = system.file("inst/extdata", "GQ6.sql.xlsx", package = "umx")
##D # installed path
##D fp = system.file("extdata", "GQ6.sql.xlsx", package = "umx")
##D umx_open(fp)
##D umx_make_sql_from_excel() # Using file selected in front-most Finder window
##D umx_make_sql_from_excel("~/Desktop/test.xlsx") # provide a path
## End(Not run)



