library(tidyhydat)


### Name: hy_src
### Title: Open a connection to the HYDAT database
### Aliases: hy_src hy_src_disconnect

### ** Examples

## Not run: 
##D library(dplyr)
##D 
##D # src is a src_sqlite
##D src <- hy_src(hydat_path = hy_test_db())
##D src_tbls(src)
##D 
##D # to get a table, use dplyr::tbl()
##D tbl(src, "STATIONS")
##D 
##D # one you're sure the results are what you want
##D # get a data.frame using collect()
##D tbl(src, "STATIONS") %>%
##D   filter(PROV_TERR_STATE_LOC == "BC") %>%
##D   collect()
##D   
##D # close the connection to the database
##D hy_src_disconnect(src)
## End(Not run)



