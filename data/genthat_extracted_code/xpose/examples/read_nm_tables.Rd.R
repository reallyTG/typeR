library(xpose)


### Name: read_nm_tables
### Title: NONMEM output table import function
### Aliases: read_nm_tables

### ** Examples

## Not run: 
##D # Import tables manually and return them as a list of individual tables
##D nm_tables <- read_nm_tables(file = c('sdtab001', 'patab001'), 
##D                             dir = 'models', combined = FALSE)
##D 
##D # Import tables manually and return them as a single merged table
##D nm_tables <- read_nm_tables(file = c('sdtab001', 'patab001'), 
##D                             dir = 'models', combined = TRUE)
##D 
##D # Import tables automatically (used internally by xpose_data())
##D nm_tables <- read_nm_model(file = 'run001.lst', dir = 'models') %>% 
##D               list_nm_tables() %>% 
##D               read_nm_tables()
##D 
##D # Passing arguments to readr via `...` 
##D # (e.g. import columns as character and only first 10 rows)
##D nm_tables <- read_nm_tables(file = 'sdtab001', dir = 'models', 
##D                             col_type = readr::cols(.default = 'c'), 
##D                             n_max = 10)
##D 
## End(Not run)



