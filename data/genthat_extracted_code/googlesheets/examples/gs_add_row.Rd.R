library(googlesheets)


### Name: gs_add_row
### Title: Append rows to a spreadsheet
### Aliases: gs_add_row

### ** Examples

## Not run: 
##D yo <- gs_copy(gs_gap(), to = "yo")
##D yo <- gs_add_row(yo, ws = "Oceania",
##D                  input = c("Valinor", "Aman", "2015", "10000",
##D                            "35", "1000.5"))
##D tail(gs_read(yo, ws = "Oceania"))
##D 
##D gs_delete(yo)
## End(Not run)




