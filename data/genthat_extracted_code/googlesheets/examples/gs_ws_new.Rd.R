library(googlesheets)


### Name: gs_ws_new
### Title: Add a new worksheet within a spreadsheet
### Aliases: gs_ws_new

### ** Examples

## Not run: 
##D # get a copy of the Gapminder spreadsheet
##D gap_ss <- gs_copy(gs_gap(), to = "Gapminder_copy")
##D gap_ss <- gs_ws_new(gap_ss)
##D gap_ss <- gs_ws_delete(gap_ss, ws = "Sheet1")
##D gap_ss <-
##D   gs_ws_new(gap_ss, ws_title = "Atlantis", input = head(iris), trim = TRUE)
##D gap_ss
##D gs_delete(gap_ss)
## End(Not run)




