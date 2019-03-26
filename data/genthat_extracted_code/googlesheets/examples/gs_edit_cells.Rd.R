library(googlesheets)


### Name: gs_edit_cells
### Title: Edit cells
### Aliases: gs_edit_cells

### ** Examples

## Not run: 
##D yo <- gs_new("yo")
##D yo <- gs_edit_cells(yo, input = head(iris), trim = TRUE)
##D gs_read(yo)
##D 
##D yo <- gs_ws_new(yo, ws = "byrow_FALSE")
##D yo <- gs_edit_cells(yo, ws = "byrow_FALSE",
##D                     input = LETTERS[1:5], anchor = "A8")
##D gs_read_cellfeed(yo, ws = "byrow_FALSE", range = "A8:A12") %>%
##D   gs_simplify_cellfeed()
##D 
##D yo <- gs_ws_new(yo, ws = "byrow_TRUE")
##D yo <- gs_edit_cells(yo, ws = "byrow_TRUE", input = LETTERS[1:5],
##D                     anchor = "A8", byrow = TRUE)
##D gs_read_cellfeed(yo, ws = "byrow_TRUE", range = "A8:E8") %>%
##D   gs_simplify_cellfeed()
##D 
##D yo <- gs_ws_new(yo, ws = "col_names_FALSE")
##D yo <- gs_edit_cells(yo, ws = "col_names_FALSE", input = head(iris),
##D                     trim = TRUE, col_names = FALSE)
##D gs_read_cellfeed(yo, ws = "col_names_FALSE") %>%
##D   gs_reshape_cellfeed(col_names = FALSE)
##D 
##D gs_delete(yo)
## End(Not run)




