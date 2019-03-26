library(googlesheets)


### Name: gs_ws_delete
### Title: Delete a worksheet from a spreadsheet
### Aliases: gs_ws_delete

### ** Examples

## Not run: 
##D gap_ss <- gs_copy(gs_gap(), to = "gap_copy")
##D gs_ws_ls(gap_ss)
##D gap_ss <- gs_ws_new(gap_ss, "new_stuff")
##D gap_ss <- gs_edit_cells(gap_ss, "new_stuff", input = head(iris), trim = TRUE)
##D gap_ss
##D gap_ss <- gs_ws_delete(gap_ss, "new_stuff")
##D gs_ws_ls(gap_ss)
##D gap_ss <- gs_ws_delete(gap_ss, ws = 3)
##D gs_ws_ls(gap_ss)
##D gs_delete(gap_ss)
## End(Not run)




