library(civis)


### Name: write_civis_file
### Title: Upload a R object or file to Civis Platform (Files endpoint)
### Aliases: write_civis_file write_civis_file.default
###   write_civis_file.character

### ** Examples

## Not run: 
##D data(iris)
##D file_id <- write_civis_file(iris)
##D read_civis(file_id)
##D 
##D file_id <- write_civis_file("path/to/my.csv")
##D read_civis(file_id, using = read.csv)
##D read_civis(file_id, using = readr::read_csv)
##D 
##D # Does not expire
##D file_id <- write_civis_file(iris, expires_at = NULL)
##D 
##D # Expires on a given date and time
##D file_id <- write_civis_file(iris, expires_at = "2030-01-01")
##D file_id <- write_civis_file(iris, expires_at = "12:00:00")
##D file_id <- write_civis_file(iris, expires_at = "2030-01-01 12:00:00")
##D 
##D # Upload a large file in parallel.
##D library(future)
##D plan(multisession)
##D file_id <- write_civis_file("my_large_file")
## End(Not run)



