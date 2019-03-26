library(gqlr)


### Name: ErrorList
### Title: ErrorList
### Aliases: ErrorList

### ** Examples

error_list <- ErrorList$new()
error_list
error_list$has_any_errors() # FALSE
error_list$has_no_errors() # TRUE

error_list$add("3.1.1", "Multiple part", " error about Scalars")
error_list
error_list$has_any_errors() # TRUE
error_list$has_no_errors() # FALSE




