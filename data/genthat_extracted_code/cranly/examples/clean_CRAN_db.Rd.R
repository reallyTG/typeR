library(cranly)


### Name: clean_CRAN_db
### Title: Clean and organise package and author names in the output of
###   'tools::CRAN_package_db()'
### Aliases: clean_CRAN_db cranly_db

### ** Examples

## Not run: 
##D ## Before cleaning
##D cran_db <- tools::CRAN_package_db()
##D cran_db[cran_db$Package == "weights", "Author"]
##D 
##D ## After clean up
##D package_db <- clean_CRAN_db(cran_db)
##D package_db[package_db$Package == "weights", "Author"]
## End(Not run)



