library(benchmarkmeData)


### Name: get_datatable_past
### Title: Interactive table of results
### Aliases: get_datatable_past

### ** Examples

## Need the DT package
## View all results for prog test
get_datatable_past("prog")
## View matrix_fun test
get_datatable_past("matrix_fun")
## View matrix_fun test - only BLAS results
get_datatable_past("matrix_fun", blas_optimize=TRUE)



