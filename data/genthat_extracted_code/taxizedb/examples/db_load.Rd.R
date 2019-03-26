library(taxizedb)


### Name: db_load
### Title: Load taxonomic databases
### Aliases: db_load db_load_itis db_load_tpl db_load_col db_load_gbif

### ** Examples

## Not run: 
##D # ITIS
##D # x <- db_download_itis()
##D # db_load_itis(x, "<your user name>", "<your password>")
##D 
##D # Plantlist
##D # x <- db_download_tpl()
##D # db_load_tpl(x, "<your user name>", "<your password>")
##D 
##D # COL
##D x <- db_download_col()
##D db_load_col(x, "<your user name>", "<your password>")
##D 
##D # GBIF
##D ## only checks if sqlite installed
##D db_load_gbif()
## End(Not run)



