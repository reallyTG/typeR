library(xltabr)


### Name: add_top_headers
### Title: Add top headers to the tab.  The top headers are provided as a
###   character vector. If you need more than one row, provide a list of
###   character vectors. Top headers are automatically assigned the
###   style_text 'top_header_1', but you may provide style overrides using
###   column_style_names and row_style_names
### Aliases: add_top_headers

### ** Examples

crosstab <- read.csv(system.file("extdata", "example_crosstab.csv", package="xltabr"))
tab <- initialise()

top_headers_row_1 <- c("", "", "Car type", "Car type", "Car type")
top_headers_row_2 <- c("Drive", "Age", "Sedan", "Sport", "Supermini")
top_headers <- list(top_headers_row_1, top_headers_row_2)

tab <- add_top_headers(tab, top_headers)



