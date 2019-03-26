library(xltabr)


### Name: add_body
### Title: Add a table body (a df) to the tab.
### Aliases: add_body

### ** Examples

crosstab <- read.csv(system.file("extdata", "example_crosstab.csv", package="xltabr"))
tab <- initialise()

# Note you could also use xltabr::auto_detect_left_headers
colnames <- c("drive", "age")
lh_styles <- "left_header"
tab <- add_body(tab, crosstab, left_header_colnames = colnames, left_header_style_names = lh_styles)



