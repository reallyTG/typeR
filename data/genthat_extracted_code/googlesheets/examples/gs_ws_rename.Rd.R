library(googlesheets)


### Name: gs_ws_rename
### Title: Rename a worksheet within a spreadsheet
### Aliases: gs_ws_rename

### ** Examples

## Not run: 
##D gap_ss <- gs_copy(gs_gap(), to = "gap_copy")
##D gs_ws_ls(gap_ss)
##D gap_ss <- gs_ws_rename(gap_ss, from = "Oceania", to = "ANZ")
##D gs_ws_ls(gap_ss)
##D gap_ss <- gs_ws_rename(gap_ss, from = 1, to = "I am the first sheet!")
##D gs_ws_ls(gap_ss)
##D gs_delete(gap_ss)
## End(Not run)




