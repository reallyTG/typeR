library(xltabr)


### Name: auto_style_number_formatting
### Title: Use the data type of the columns to choose an automatic Excel
###   format for body cells
### Aliases: auto_style_number_formatting

### ** Examples

body_data <- readRDS(system.file("extdata", "test_number_types.rds", package="xltabr"))
tab <- initialise()
tab <- add_body(tab, body_data)
tab <- auto_style_number_formatting(tab)



