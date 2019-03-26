library(lgr)


### Name: default_exception_handler
### Title: Demote an Exception to a Warning
### Aliases: default_exception_handler

### ** Examples

tryCatch(stop("an error has occurred"), error = default_exception_handler)




