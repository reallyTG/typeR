library(dplyr)


### Name: check_dbplyr
### Title: dbplyr compatibility functions
### Aliases: check_dbplyr wrap_dbplyr_obj
### Keywords: internal

### ** Examples

if (requireNamespace("dbplyr", quietly = TRUE)) {
wrap_dbplyr_obj("build_sql")
wrap_dbplyr_obj("base_agg")
}



