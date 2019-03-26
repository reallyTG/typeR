library(googlesheets)


### Name: cell-specification
### Title: Specify cells for reading or writing
### Aliases: cell-specification cell_limits cell_rows cell_cols anchored

### ** Examples

## Not run: 
##D gs_gap() %>% gs_read(ws = 2, range = "A1:D8")
##D gs_gap() %>% gs_read(ws = "Europe", range = cell_rows(1:4))
##D gs_gap() %>% gs_read(ws = "Europe", range = cell_rows(100:103),
##D                      col_names = FALSE)
##D gs_gap() %>% gs_read(ws = "Africa", range = cell_cols(1:4))
##D gs_gap() %>% gs_read(ws = "Asia", range = cell_limits(c(1, 5), c(4, NA)))
## End(Not run)




