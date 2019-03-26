library(googlesheets)


### Name: gs_new
### Title: Create a new spreadsheet
### Aliases: gs_new

### ** Examples

## Not run: 
##D foo <- gs_new()
##D foo
##D gs_delete(foo)
##D 
##D foo <- gs_new("foo", ws_title = "numero uno", 4, 15)
##D foo
##D gs_delete(foo)
##D 
##D foo <- gs_new("foo", ws = "I know my ABCs", input = letters, trim = TRUE)
##D foo
##D gs_delete(foo)
## End(Not run)




