library(googlesheets)


### Name: gs_read_cellfeed
### Title: Read data from cells
### Aliases: gs_read_cellfeed

### ** Examples

## Not run: 
##D gap_ss <- gs_gap() # register the Gapminder example sheet
##D col_4_and_above <-
##D   gs_read_cellfeed(gap_ss, ws = "Asia", range = cell_limits(c(NA, 4)))
##D col_4_and_above
##D gs_reshape_cellfeed(col_4_and_above)
##D 
##D gs_read_cellfeed(gap_ss, range = "A2:F3")
## End(Not run)



