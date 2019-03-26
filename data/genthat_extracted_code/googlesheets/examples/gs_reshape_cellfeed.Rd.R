library(googlesheets)


### Name: gs_reshape_cellfeed
### Title: Reshape data from the "cell feed"
### Aliases: gs_reshape_cellfeed

### ** Examples

## Not run: 
##D gap_ss <- gs_gap() # register the Gapminder example sheet
##D gs_read_cellfeed(gap_ss, "Asia", range = cell_rows(1:4))
##D gs_reshape_cellfeed(gs_read_cellfeed(gap_ss, "Asia", range = cell_rows(1:4)))
##D gs_reshape_cellfeed(gs_read_cellfeed(gap_ss, "Asia",
##D                                      range = cell_rows(2:4)),
##D                     col_names = FALSE)
##D gs_reshape_cellfeed(gs_read_cellfeed(gap_ss, "Asia",
##D                                      range = cell_rows(2:4)),
##D                     col_names = paste0("yo", 1:6))
##D 
##D ff_ss <- gs_ff() # register example sheet with formulas and formatted nums
##D ff_cf <- gs_read_cellfeed(ff_ss)
##D gs_reshape_cellfeed(ff_cf) # almost all vars are character
##D gs_reshape_cellfeed(ff_cf, literal = FALSE) # more vars are numeric
## End(Not run)



