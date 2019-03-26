library(xltabr)


### Name: auto_style_indent
### Title: Consolidate the header columns into one, taking the rightmost
###   value and applying indent
### Aliases: auto_style_indent

### ** Examples

crosstab <- read.csv(system.file("extdata", "example_crosstab.csv", package="xltabr"))
tab <- initialise()
tab <- add_body(tab, crosstab, left_header_colnames = c("drive", "age"))
tab <- auto_style_indent(tab)



