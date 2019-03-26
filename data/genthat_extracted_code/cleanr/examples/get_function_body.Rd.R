library(cleanr)


### Name: get_function_body
### Title: get the body of a function
### Aliases: get_function_body
### Keywords: internal

### ** Examples

source(system.file("source", "R", "utils.R", package = "cleanr"))
require(checkmate)
cleanr:::get_function_body(set_cleanr_options)[3:6]
utils::capture.output(body(set_cleanr_options))[4:6]



