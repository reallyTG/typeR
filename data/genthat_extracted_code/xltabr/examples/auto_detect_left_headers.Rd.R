library(xltabr)


### Name: auto_detect_left_headers
### Title: Uses the presence of '(all)' in the leftmost columns of data to
###   detect that these columns are really left headers rather than body
###   columns
### Aliases: auto_detect_left_headers

### ** Examples

crosstab <- read.csv(system.file("extdata", "example_crosstab.csv", package="xltabr"))
tab <- initialise()
tab <- add_body(tab, crosstab)
tab <- auto_detect_left_headers(tab)



