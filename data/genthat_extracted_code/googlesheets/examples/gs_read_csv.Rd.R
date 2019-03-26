library(googlesheets)


### Name: gs_read_csv
### Title: Read data via the 'exportcsv' link
### Aliases: gs_read_csv

### ** Examples

## Not run: 
##D gap_ss <- gs_gap() # register the Gapminder example sheet
##D oceania_csv <- gs_read_csv(gap_ss, ws = "Oceania")
##D str(oceania_csv)
##D oceania_csv
##D 
##D ## crazy demo of passing args through to readr::read_csv()
##D oceania_crazy <- gs_read_csv(gap_ss, ws = "Oceania",
##D   col_names = paste0("Z", 1:6), na = "1962", col_types = "cccccc", skip = 1)
##D oceania_crazy
## End(Not run)



