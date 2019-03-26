library(civis)


### Name: fetch_all
### Title: Retrieve all results from a paginated endpoint
### Aliases: fetch_all

### ** Examples

## Not run: 
##D columns <- fetch_all(tables_list_columns, id = 123)
##D column_names <- columns %>% purrr::map_chr("name")
## End(Not run)



