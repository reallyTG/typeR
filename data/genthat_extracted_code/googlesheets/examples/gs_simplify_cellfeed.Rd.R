library(googlesheets)


### Name: gs_simplify_cellfeed
### Title: Simplify data from the "cell feed"
### Aliases: gs_simplify_cellfeed

### ** Examples

## Not run: 
##D gap_ss <- gs_gap() # register the Gapminder example sheet
##D (gap_cf <- gs_read_cellfeed(gap_ss, range = cell_rows(1)))
##D gs_simplify_cellfeed(gap_cf)
##D gs_simplify_cellfeed(gap_cf, notation = "R1C1")
##D 
##D (gap_cf <- gs_read_cellfeed(gap_ss, range = "A1:A10"))
##D gs_simplify_cellfeed(gap_cf)
##D gs_simplify_cellfeed(gap_cf, col_names = FALSE)
##D 
##D ff_ss <- gs_ff() # register example sheet with formulas and formatted nums
##D ff_cf <- gs_read_cellfeed(ff_ss, range = cell_cols(3))
##D gs_simplify_cellfeed(ff_cf)                  # rounded to 2 digits
##D gs_simplify_cellfeed(ff_cf, literal = FALSE) # hello, more digits!
## End(Not run)




