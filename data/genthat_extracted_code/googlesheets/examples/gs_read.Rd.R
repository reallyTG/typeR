library(googlesheets)


### Name: gs_read
### Title: Read data
### Aliases: gs_read

### ** Examples

## Not run: 
##D gap_ss <- gs_gap()
##D oceania_csv <- gs_read(gap_ss, ws = "Oceania")
##D str(oceania_csv)
##D oceania_csv
##D 
##D gs_read(gap_ss, ws = "Europe", n_max = 4, col_types = c("cccccc"))
##D 
##D gs_read(gap_ss, ws = "Oceania", range = "A1:C4")
##D gs_read(gap_ss, ws = "Oceania", range = "R1C1:R4C3")
##D gs_read(gap_ss, ws = "Oceania", range = "R2C1:R4C3", col_names = FALSE)
##D gs_read(gap_ss, ws = "Oceania", range = "R2C5:R4C6",
##D         col_names = c("thing_one", "thing_two"))
##D gs_read(gap_ss, ws = "Oceania", range = cell_limits(c(1, 3), c(1, 4)),
##D         col_names = FALSE)
##D gs_read(gap_ss, ws = "Oceania", range = cell_rows(1:5))
##D gs_read(gap_ss, ws = "Oceania", range = cell_cols(4:6))
##D gs_read(gap_ss, ws = "Oceania", range = cell_cols("A:D"))
##D 
##D ff_ss <- gs_ff() # register example sheet with formulas and formatted nums
##D gs_read(ff_ss)                  # almost all vars are character
##D gs_read(ff_ss, literal = FALSE) # more vars are properly numeric
## End(Not run)




