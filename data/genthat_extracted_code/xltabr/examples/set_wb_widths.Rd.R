library(xltabr)


### Name: set_wb_widths
### Title: Set column widths to tab workbook
### Aliases: set_wb_widths

### ** Examples

crosstab <- read.csv(system.file("extdata", "example_crosstab.csv", package="xltabr"))
tab <- initialise()
colnames <- c("drive", "age")
tab <- add_body(tab, crosstab, left_header_colnames = colnames)
tab <- set_wb_widths(tab, left_header_col_widths = "auto", body_header_col_widths = c(7,14,28))



