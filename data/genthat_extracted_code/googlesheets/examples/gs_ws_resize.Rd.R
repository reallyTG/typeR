library(googlesheets)


### Name: gs_ws_resize
### Title: Resize a worksheet
### Aliases: gs_ws_resize
### Keywords: internal

### ** Examples

## Not run: 
##D yo <- gs_new("yo")
##D yo <- gs_edit_cells(yo, input = head(iris), trim = TRUE)
##D gs_read_csv(yo)
##D yo <- gs_ws_resize(yo, ws = "Sheet1", row_extent = 5, col_extent = 4)
##D gs_read_csv(yo)
##D yo <- gs_ws_resize(yo, ws = 1, row_extent = 3, col_extent = 3)
##D gs_read_csv(yo)
##D yo <- gs_ws_resize(yo, row_extent = 2, col_extent = 2)
##D gs_read_csv(yo)
##D gs_delete(yo)
## End(Not run)




